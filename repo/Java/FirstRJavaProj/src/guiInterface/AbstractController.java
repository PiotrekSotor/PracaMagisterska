package guiInterface;

import javax.swing.JPanel;

public abstract class AbstractController extends JPanel implements Runnable {

	public abstract void initialize();

	@Override
	public final void run() {
		initialize();

	}

}
