package com.guest.honolja.main;

import java.net.HttpURLConnection;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.Buffer;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.Vector;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Server;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.WebUtils;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainDAO dao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/main.do")
	public ModelAndView main_page(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main");
		
		
		String access_token = "";
		
		//NAVER API Login part
		if(request.getParameter("code") != null) {
			
				String clientId = "KhHvxQuRC4gDkDcMKUBF";//Application Client ID Value
			    String clientSecret = "zIRvSbAaRp";//Application Client Secret Value
			    String code = request.getParameter("code");
			    String state = request.getParameter("state");
    
			    String redirectURI = null;
				try {
					//Address going to back
					redirectURI = URLEncoder.encode("http://localhost:8080/honolja/main.do", "UTF-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			    String apiURL;
			    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			    apiURL += "client_id=" + clientId;
			    apiURL += "&client_secret=" + clientSecret;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&code=" + code;
			    apiURL += "&state=" + state;
			    //String access_token = "";
			    String refresh_token = "";
			    System.out.println("apiURL="+apiURL);
			    try {
			      URL url = new URL(apiURL);
			      HttpURLConnection con = (HttpURLConnection)url.openConnection();
			      con.setRequestMethod("GET");
			      int responseCode = con.getResponseCode();
			      BufferedReader br;
			      
			      System.out.print("responseCode = " + responseCode + "\n");
			      
			      if(responseCode==200) { //Login Success
			    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			    	System.out.println("NAVER Login Success !!!!");
			    	
			      } else {  //error occurred	    	  
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			        System.out.println("NAVER Login Fail !!!!");
			      }
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {
			        res.append(inputLine);
			      }
			      br.close();
			      if(responseCode==200) {
			    	  //res.toString(); --> Enumerate naver_login_token_informations as JSON type
			    	  System.out.println("StringBuffer = " + res.toString());
			        
			    	  //get access_token from naver_login JSON data
			    	  JSONObject obj = new JSONObject(res.toString());
			    	  access_token = obj.getString("access_token");
			    	  
			    	  
			    	  
			    	  //start to insert info into users DB table.
			    	  String token = access_token;//NAVER Login access_token;
			  		
			          String header = "Bearer " + token; //Add gap after Bearer;
			          try {
			          	
			              apiURL = "https://openapi.naver.com/v1/nid/me";   
			              url = new URL(apiURL);
			              
			              con = (HttpURLConnection)url.openConnection();
			  	            con.setRequestMethod("GET");
			  	            con.setRequestProperty("Authorization", header);
			  	            
			              responseCode = con.getResponseCode();
			              
			              if(responseCode==200) { // Success calling
			                  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			                  System.out.println("Success to Private Information Access!!!!");
			              } else {  //Occurred error
			                  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			                  System.out.println("Fail to Private Information Access!!!!");
			              }

			              StringBuffer response = new StringBuffer();
			              
			              while ((inputLine = br.readLine()) != null) {
			                  response.append(inputLine);
			              }
			              
			              br.close();
			              
			              //response.toString() is to enumerate NAVER_PRIVATE_VALUES of JSON Type
			              System.out.println(response.toString());
			              	
//			              Below Example is to get String value of Private Information from JSON data.
			              
			              String temp = response.toString();
			              obj = new JSONObject(temp);
			              
			              String u_id = obj.getJSONObject("response").getString("id");
			              String u_img = obj.getJSONObject("response").getString("profile_image");
			              String u_gender = obj.getJSONObject("response").getString("gender");
			              String u_email = obj.getJSONObject("response").getString("email");
			              String u_name = obj.getJSONObject("response").getString("name");
			              String u_birth = obj.getJSONObject("response").getString("birthday");
       
			              //progress, if Id is not in users table
			              if(dao.dbSelectIdCheck(u_id) == 0) {

			              MainDTO dto = new MainDTO();
			              	dto.setU_id(u_id);
			              	dto.setU_img(u_img);
			              	dto.setU_gender(u_gender);
			              	dto.setU_email(u_email);
			              	dto.setU_name(u_name);
			              	dto.setU_birth(u_birth);
			              	  	
			              dao.dbInsertUsersInfo(dto);
			              System.out.println("users Info insert success!!");
			              
//			              System.out.println("u_id " + u_id);
//			              System.out.println("u_img " + u_img);
//			              System.out.println("u_gender " + u_gender);
//			              System.out.println("u_email " + u_email);
//			              System.out.println("u_name " + u_name);
//			              System.out.println("u_birth " + u_birth);
			              
			              mav.addObject("u_id", u_id);
			              	
			              }else {
			            	  System.out.println("user Id already exist!!");
			              }
			          } catch (Exception e) {
			              System.out.println(e);
			          }
			      }
			    } catch (Exception e) {
			      System.out.println(e);
			    }
			
		}

 		
		
			
		return mav;
	}
	
	
	@RequestMapping("/login_popup.do")
	public ModelAndView main_login_popup(HttpServletRequest request, Model model) {
		
		String u_id = request.getParameter("id");
		String u_pwd = request.getParameter("pwd");
		String host =  request.getParameter("host");
		int idCheck = 0;
		
		HttpSession session = request.getSession();
		
		String scriptMsg = null;
		String alertMsg = null;

		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/login_popup");
			
		//if params have id_value and pwd_value, progress dto/dao
		if(u_id != null || u_pwd != null) {
			MainDTO dto = new MainDTO();
				dto.setU_id(u_id);
				dto.setU_pwd(u_pwd);
			
			idCheck = dao.dbSelect(dto);
		}
		
		if(idCheck > 0) {

			model.addAttribute("checked", u_id);
			
			alertMsg = "Login Success!!";
				
			scriptMsg = "opener.parent.location='"+host+"';";
			scriptMsg += "self.close();";
			
			
		}else {	
			alertMsg = "Id or Password is wrong.";
		}
		
			//JavaScript sentence send
			mav.addObject("scriptMsg", scriptMsg);
			mav.addObject("alertMsg", alertMsg);
			
		//if I'm NonLogin and there is Cookie saving login_id then Send id_value to page
		if(session.getAttribute("checked") == null) {
			try {
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				mav.addObject("loginCookie", loginCookie.getValue());
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return mav;
	}
	
	@RequestMapping("/naver_login.do")
	public RedirectView common_naver_login(Model model) {
		
		//NAVER API Login
	    String clientId = "KhHvxQuRC4gDkDcMKUBF";//Application Client ID Value
	    String redirectURI = null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8080/honolja/main.do", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    
	    model.addAttribute("checked", state);
	    //session.setAttribute("state", state);
	    	
    	RedirectView redirectView = new RedirectView();
    		redirectView.setUrl(apiURL);
		
		return redirectView;
	}

	
	@RequestMapping("/header.do")
	public ModelAndView common_header() {

		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/header");

		return mav;		
	}
	
	@RequestMapping("/footer.do")
	public String common_footer() {
		return "/main/footer";
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView common_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();

		//Host is an address to go back After logout
		mav.setViewName("redirect:/" + request.getParameter("host"));
		
		if(session.getAttribute("checked") != null) {
			session.removeAttribute("checked");
			session.invalidate();
			
			//Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			//if(loginCookie != null) {
			//	loginCookie.setMaxAge(0);
			//response.addCookie(loginCookie);
			
			//}
		}
		
		return mav;
	}
	
	int rn = 0;
	
	@RequestMapping("/main_notice.do")
	public ModelAndView main_notice() {
		
		List<MainDTO> notices = dao.dbSelectFixedNotice();
		
		rn++;
		if(rn == notices.size()) rn = 0;

		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/main_notice");
			mav.addObject("notice", notices.get(rn).getN_title());
			
		return mav;
	}
	
	@RequestMapping("/img_board.do")
	public ModelAndView main_img_board(HttpServletRequest request) {
		
		int page = 1;
		
		//Print list every 10 lines according to page_num
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int list_start = 1 + 10 * (page-1);
		int list_end = list_start + 9;
		
		//Get the search key&value from view
		String skey = request.getParameter("skey");
		String sval = request.getParameter("sval");
	
		MainDTO dto = new MainDTO();
			dto.setList_start(list_start);
			dto.setList_end(list_end);
			dto.setSkey(skey);
			dto.setSval(sval);
		
		//Get the list from DB 
		List<MainDTO> list = dao.dbSelectImgBoard(dto);
					
			
		//Print page_button according to page_num
		int page_btn_start = page - (page - 1) % 10;
		int page_btn_end = page_btn_start + 9;
		
		
		//Get the total count
		int total_page = dao.dbCountImgBoard(dto);
		
		boolean page_end_flag = true;

		if(total_page % 10 == 0) {
			if(page_btn_end > total_page / 10) {
				page_btn_end = total_page /10;
				page_end_flag = false;
			}else {
				page_end_flag = true;
			}
		}else {
			if(page_btn_end > total_page / 10 + 1) {
				page_btn_end = total_page /10 + 1;
				page_end_flag = false;
			}else {
				page_end_flag = true;
			}
		}
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/img_board");
			mav.addObject("img_board", "class='active'");
			mav.addObject("list", list); //out image board list
			mav.addObject("page", page); //for pager button clicked
			mav.addObject("page_btn_start", page_btn_start);
			mav.addObject("page_btn_end", page_btn_end);
			mav.addObject("total_page", total_page);
			mav.addObject("page_end_flag", page_end_flag);
			
		return mav;
	}
	
	@RequestMapping("/img_board_detail.do")
	public ModelAndView main_img_board_detail(HttpServletRequest request) {
		
		String i_no = request.getParameter("i_no");
		
		MainDTO dto = dao.dbSelectImgBoardDetail(i_no);
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/img_board_detail");
			mav.addObject("img_board", "class='active'");
			mav.addObject("dto", dto);
			
		return mav;
	}
	
	@RequestMapping("/img_board_write.do")
	public ModelAndView main_img_board_write(HttpServletRequest request) {
	
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/img_board_write");
			mav.addObject("img_board", "class='active'");
			
		return mav;
	}
	
	@RequestMapping("/img_board_write_backend.do")
	public ModelAndView main_img_board_write_backend(MultipartHttpServletRequest request) {
		
		String i_title = request.getParameter("title");
		String i_content = request.getParameter("content");
		String u_id = request.getParameter("id");
		MultipartFile mf = request.getFile("upload_f");
			
		//start to save file
		
		//set save_path
		String path = application.getRealPath("/resources/info_images");
			System.out.println("application.getRealPath : " + path);
			
		//set uploadFileName
		UUID random_path = UUID.randomUUID();
			System.out.println("random_path : " + random_path.toString());
			
		String i_originalFilename = mf.getOriginalFilename();
			System.out.println("i_originalFilename : " + i_originalFilename);
			
		String i_uploadFileName = random_path + "_" + i_originalFilename;
			System.out.println("i_uploadFileName : " + i_uploadFileName);
			
		//get file_size
		String i_fileSize = String.valueOf(mf.getSize()) + "byte";
			System.out.println("i_fileSizee : " + i_fileSize);
			
		//set File
		File file = new File(path, i_uploadFileName);
		
		//try to save file
		try {
			mf.transferTo(file); // 변환 시도			
		}catch(Exception e) {}
		
		MainDTO dto = new MainDTO();	
			dto.setI_title(i_title);
			dto.setI_content(i_content);
			dto.setI_originalFileName(i_originalFilename);
			dto.setI_uploadFileName(i_uploadFileName);
			dto.setI_fileSize(i_fileSize);
			dto.setU_id(u_id);
			
		dao.dbInsertImgBoard(dto);
			
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/img_board.do");
			
		return mav;
	}
	
	@RequestMapping("/img_board_detail_download.do")
	public ModelAndView main_img_board_detail_download(HttpServletRequest request, HttpServletResponse response) {
		
		String i_no = request.getParameter("i_no");
		String path = application.getRealPath("/resources/info_images");
		
		MainDTO dto = dao.dbSelectImgBoardDetail(i_no);
		
		String i_uploadFileName = dto.getI_uploadFileName();
		
		try {
			response.setHeader("Content-Disporition", 
								"attachment;filename=" 
								+ new String(i_uploadFileName.getBytes("UTF-8"), "ISO-8859-1")
						);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		File file = new File(path, i_uploadFileName);
		
		InputStream is = null;
		OutputStream os = null;
		byte[] b = null;
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/img_board_detail.do?i_no=" + i_no);
			
		return mav;
	}
	
	
	@RequestMapping("/test.do")
	public ModelAndView main_test(HttpServletRequest request) {
		
		
		ModelAndView mav = new ModelAndView();
			mav.setViewName("/main/test");
			mav.addObject("test", "class='active'");
			
		return mav;
	}
	
}
