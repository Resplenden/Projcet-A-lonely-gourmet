package edu.study.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.study.vo.CalculatorVo;



@RequestMapping(value="oper")
@Controller
public class CalculatorController {
	
	@RequestMapping(value="/calc.do", method=RequestMethod.GET)
	public String calculator() {
						
		return "oper/calculator";
	}
	
	
	@RequestMapping(value="/calc.do", method=RequestMethod.POST)
	public String calculator(CalculatorVo vo, Model model) {
		System.out.println(vo.toString());
		int result = 0;
		
		if(vo.getOper() != null && !vo.getOper().equals("")) {
			if(vo.getOper().equals("plus")) {
				result = vo.getNum1()+vo.getNum2();
			}else if(vo.getOper().equals("minus")) {
				result = vo.getNum1()-vo.getNum2();
			}else if(vo.getOper().equals("multi")) {
				result = vo.getNum1()*vo.getNum2();
			}else if(vo.getOper().equals("div")) {
				result = vo.getNum1()/vo.getNum2();
			}
			
			model.addAttribute("result", result);
			model.addAttribute("Calculatorvo", vo);
			
		}else {
			model.addAttribute("result", "��ȿ���� ���� �������Դϴ�.");
		}
		//MVC������ ���������ϱ⿡ ���� �����ϴ�.(�м��� ������ ���ϴ�. �뵵�� �°� �ɰ����ִ�.)
		
		
		
		return "/oper/result";
		
	}
	
	
}
