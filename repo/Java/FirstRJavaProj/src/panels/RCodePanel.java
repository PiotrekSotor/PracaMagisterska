package panels;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.text.DefaultCaret;

import guiInterface.ViewInteraction;

public class RCodePanel extends MainPanel {
    static JTextArea codeArea;

    static JScrollPane codeScrollPane;
    static JScrollPane parameterScrollPane;

    static List<Pair<ParameterDescription, RemoveButton>> parameterList;
    static AddButton addButton;

    static MainPanel parameterPane;

    public RCodePanel(ViewInteraction vi) {
        super(vi);
        setPreferredSize(new Dimension(800, 600));
        setLayout(new GridLayout(2, 2));

        codeArea = new JTextArea();
        codeArea.setEditable(true);

        DefaultCaret caret = (DefaultCaret) codeArea.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
        parameterList = new ArrayList<>();
        parameterPane = new MainPanel(vi);
        addButton = new AddButton();

        parameterScrollPane = new JScrollPane(parameterPane);
        codeScrollPane = new JScrollPane(codeArea);

        refreshParameterScrollPane();

        add(parameterScrollPane);
        add(codeScrollPane);

    }

    private void refreshParameterScrollPane() {

        for (Component com : parameterPane.getComponents()) {
            parameterPane.remove(com);
        }

        for (int i = 0; i < parameterList.size(); ++i) {
            Pair<ParameterDescription, RemoveButton> par = parameterList.get(i);

            parameterPane.add(par.getLeft());
            RemoveButton removeButton = par.getRight();
            removeButton.setIndex(i);
            parameterPane.add(removeButton);
        }
        parameterPane.add(addButton);
        parameterPane.repaint();
        parameterScrollPane.repaint();
    }

    public void removeParameter(int index) {
        parameterList.remove(index);
        refreshParameterScrollPane();
    }

    public void addParameter() {
        ParameterDescription par = new ParameterDescription();
        RemoveButton rem = new RemoveButton();
        parameterList.add(new Pair<ParameterDescription, RemoveButton>(par, rem));
        refreshParameterScrollPane();
    }

    public String getText() {
        return codeArea.getText();
    }

    class ParameterDescription extends MainPanel {
        JTextField name;
        JTextField lowerBound;
        JTextField upperBound;

        public ParameterDescription() {
            name = new JTextField();
            lowerBound = new JTextField();
            upperBound = new JTextField();
            add(name);
            add(lowerBound);
            add(upperBound);
        }
    }

    class RemoveButton extends JButton {
        int index;

        public RemoveButton() {
            super();
            addActionListener(l -> viewInteraction.removeParameter(index));
        }

        public void setIndex(int i) {
            index = i;
        }
    }

    class AddButton extends JButton {
        public AddButton() {
            super("add");
            addActionListener(l -> viewInteraction.addParameter());
        }
    }

    class Pair<L, R> {

        private final L left;
        private final R right;

        public Pair(L left, R right) {
            this.left = left;
            this.right = right;
        }

        public L getLeft() {
            return left;
        }

        public R getRight() {
            return right;
        }

        @Override
        public int hashCode() {
            return left.hashCode() ^ right.hashCode();
        }

        @Override
        public boolean equals(Object o) {
            if (!(o instanceof Pair))
                return false;
            Pair pairo = (Pair) o;
            return this.left.equals(pairo.getLeft()) &&
                    this.right.equals(pairo.getRight());
        }

    }
}
