package interfaces;

import org.rosuda.JRI.Rengine;

import guiInterface.RConsoleLogPanel;

public class RMainLoopCallbacks extends AbstractRMainLoopCallbacks {

    @Override
    public void rWriteConsole(Rengine arg0, String arg1, int arg2) {

        System.out.println("R: " + arg1);
        RConsoleLogPanel.appendLog("R: " + arg1);
    }

}
