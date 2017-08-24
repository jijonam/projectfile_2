package myexception;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.springframework.beans.factory.annotation.Autowired;

public class MyExcepHndlr extends Exception {

	@Autowired
	HttpServletRequest request;
		
	public void process(JoinPoint thisJoinPoint, Exception exception) throws Exception {
		//System.out.println("---MyException process()--- : " + exception.getMessage());
		Signature sign = thisJoinPoint.getSignature();
		System.out.println("---[Exception]" + sign.getDeclaringTypeName() +":"+sign.getName() +":" + exception.getMessage() + "---");
		//System.out.println("          --[³»¿ë]:" + exception.getMessage());
		
		String msg = exception.getMessage();
		
		if(msg.startsWith("[no_exist]")){
			request.setAttribute("error", "no_exist");
		}else if(msg.startsWith("[no_enough]")){
			request.setAttribute("error", "no_enough");
		}
		
		
		
		
	}
}
