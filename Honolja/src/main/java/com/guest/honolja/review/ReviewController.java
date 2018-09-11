package com.guest.honolja.review;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.guest.honolja.main.MainController;

@Controller
public class ReviewController {

	@Autowired
	ReviewDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

}