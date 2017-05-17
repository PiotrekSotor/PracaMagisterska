package interfaces;

import org.rosuda.JRI.Rengine;

public class RMainLoopCallbacks extends AbstractRMainLoopCallbacks {

	@Override
	public void rWriteConsole(Rengine arg0, String arg1, int arg2) {
		// TODO Auto-generated method stub
		System.out.println("R: "+arg1);
	}
}
