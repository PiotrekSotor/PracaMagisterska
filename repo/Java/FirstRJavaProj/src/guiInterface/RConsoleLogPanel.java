package guiInterface;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.text.DefaultCaret;

public class RConsoleLogPanel extends JPanel {

    static JTextArea logArea;

    public RConsoleLogPanel() {

        setPreferredSize(new Dimension(800, 150));

        logArea = new JTextArea();
        logArea.setEditable(false);

        DefaultCaret caret = (DefaultCaret) logArea.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);

        setLayout(new GridLayout(1, 1));
        add(new JScrollPane(logArea));

    }

    public static void appendLog(String log) {
        logArea.append(log);
        logArea.append("\n");
    }

}
