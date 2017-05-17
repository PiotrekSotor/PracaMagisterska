package interfaces;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class REngineServiceImpl implements REngineService {

	
	public REngineServiceImpl() {
		System.out.println("REngineServiceImpl");
	}
	
	@Override
	public String hello() {
		
		return new String("Hello!");
	}

}
