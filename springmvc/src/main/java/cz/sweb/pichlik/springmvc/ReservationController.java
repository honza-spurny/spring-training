package cz.sweb.pichlik.springmvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cz.sweb.pichlik.Reservation;
import cz.sweb.pichlik.ReservationService;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService resService;
    
    @RequestMapping("/reservations.htm")
    public ModelMap getReservations() {
    	ModelMap mm = new ModelMap();
    	mm.addAttribute("reservations", resService.getReservations());
    	mm.addAttribute("books", resService.getAllAvailBooks());
        return mm;
    }
    
    @RequestMapping("/showReservations")
    public ModelAndView getReservations_withoutHtm() {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("reservations", resService.getReservations());
    	mav.addObject("books", resService.getAllAvailBooks());

    	// chceme zobrazit stranku /WEB-INF/jsp/reservations.jsp
    	mav.setViewName("reservations");
    	
    	return mav;
    }
    
    @RequestMapping("/addReservation/{bookId}")
    public ModelAndView addReservation(@PathVariable long bookId) {
    	Reservation reservation = this.resService.reserveBook(bookId);
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("reservation", reservation);
    	mav.setViewName("reservation");
    	
    	return mav;
    }
    
    @RequestMapping( value="/addReservation", params="bookId")
    public ModelAndView addReservation_fromParam(@RequestParam long bookId) {
    	return addReservation(bookId);
    }

    @RequestMapping("/addReservation")
    public ModelAndView createReservation() {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("books", resService.getAllAvailBooks());
    	mav.setViewName("createReservation");
    	
    	return mav;
    }
}
