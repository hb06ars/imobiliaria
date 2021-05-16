package brandaoti.sistema.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErroController implements ErrorController  {

    
	@RequestMapping("/error")
    public String handleError() {
        return "erro";
    }

    @Override
    public String getErrorPath() {
        return "/erro";
    }
}

