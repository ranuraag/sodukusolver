package com.msit.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
@RequestMapping("/views")
public class ViewsController {
 
    @RequestMapping(value = "/test")
    public String test(ModelMap model) {
        model.addAttribute("message", "Working");
        return "testpage";
    }
    
    @RequestMapping(value = "/sudoku", method = RequestMethod.GET)
    public String showSudoku() {
    	return "sudoku";
    }
    
//    @RequestMapping(value = "/form", method = RequestMethod.POST)
//    public String redirect(@RequestParam String searchType) {
//    	//model.addAttribute("searchType", searchType);
//    	if(searchType.equals("search")) {
//    		return "redirect:search";
//    	} else if(searchType.equals("searchbydate")) {
//    		return "redirect:searchbydate";
//    	} else if(searchType.equals("searchbyf")) {
//    		return "redirect:searchbyf";
//    	} else if(searchType.equals("searchbysid")) {
//    		return "redirect:searchbysid";
//    	} else if(searchType.equals("searchbysymbol")) {
//    		return "redirect:searchbysymbol";
//    	}
//    	return "form";
//    }
//    
//    @RequestMapping(value = "/search", method = RequestMethod.GET)
//    public String showSearch(){
//		return "search";
//    }
//    
//    @RequestMapping(value = "/searchbydate", method = RequestMethod.GET)
//    public String showSearchByDate(){
//		return "searchbydate";
//    }
//    
//    @RequestMapping(value = "/searchbyf", method = RequestMethod.GET)
//    public String showSearchByF(){
//		return "searchbyf";
//    }
//    
//    @RequestMapping(value = "/searchbysid", method = RequestMethod.GET)
//    public String showSearchBySeries_idIndex(){
//		return "searchbysid";
//    }
//    
//    @RequestMapping(value = "/searchbysymbol", method = RequestMethod.GET)
//    public String showSearchBySymbolIndex(){
//		return "searchbysymbol";
//    }
    
}