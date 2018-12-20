package com.msit.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.msit.model.Model;
import com.msit.sudoku.BacktrackingAlgorithm;

@RestController // to let it know this is a controller class. @RestController = @Controller+@ResponseBody
@RequestMapping("/services") // requests will be sent to this controller when this route/end-point is encountered.
public class ServicesController {
	ObjectMapper mapper = new ObjectMapper();
	BacktrackingAlgorithm solver;
			
	@RequestMapping(value = "/test")
	public String test() {
		return "Working.";
	}
	
	
	@RequestMapping(value = "/solve", method = RequestMethod.POST)
	public int[][] solve(@RequestBody String request) throws JsonParseException, JsonMappingException, IOException {	
		Model model = mapper.readValue(request, Model.class); // Maps request values to a model obj.
		solver = new BacktrackingAlgorithm();
		return solver.solveBoard(model.getBoard());
	}
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public boolean check(@RequestBody String request) throws JsonParseException, JsonMappingException, IOException {	
		Model model = mapper.readValue(request, Model.class); // Maps request values to a model obj.
		solver = new BacktrackingAlgorithm();
		return solver.solve(model.getBoard());
	}
	
	@RequestMapping(value = "/random", method = RequestMethod.POST)
	public int[][] getRandomPreset(){	
		return new Model().getRandomPreset();
	}

}