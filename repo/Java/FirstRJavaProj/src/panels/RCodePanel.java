package panels;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFormattedTextField;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.text.DefaultCaret;

import guiInterface.ComponentWithLabel;
import guiInterface.RelativeLayout;
import guiInterface.ViewInteraction;

public class RCodePanel extends MainPanel {
    static JTextArea codeArea;

    static JScrollPane codeScrollPane;
    static JScrollPane parameterScrollPane;

    static List<Pair<ParameterDescription, RemoveButton>> parameterList;
    static AddButton addButton;

    static MainPanel parameterPane;

    private GenerationButton codeGenerationButton;

    public RCodePanel(ViewInteraction vi) {
        super(vi);
        setPreferredSize(new Dimension(800, 600));
        setLayout(new RelativeLayout(RelativeLayout.Y_AXIS, 5));

        codeArea = new JTextArea();
        codeArea.setEditable(true);

        DefaultCaret caret = (DefaultCaret) codeArea.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
        parameterList = new ArrayList<>();
        parameterPane = new MainPanel(vi);
        parameterPane.setLayout(new GridLayout(0, 1));
        // parameterPane.setPreferredSize(new Dimension(800, 150));
        codeArea.setPreferredSize(new Dimension(800, 300));

        addButton = new AddButton();
        codeGenerationButton = new GenerationButton();

        parameterScrollPane = new JScrollPane(parameterPane);
        codeScrollPane = new JScrollPane(codeArea);

        refreshParameterScrollPane();

        add(parameterScrollPane, new Float(1));
        add(codeScrollPane, new Float(4));

    }

    private void refreshParameterScrollPane() {

        for (Component com : parameterPane.getComponents()) {
            parameterPane.remove(com);
        }

        for (int i = 0; i < parameterList.size(); ++i) {
            Pair<ParameterDescription, RemoveButton> par = parameterList.get(i);

            JPanel innerPanel = new JPanel();
            innerPanel.setLayout(new RelativeLayout(RelativeLayout.X_AXIS));
            innerPanel.add(par.getLeft(), new Float(5));
            RemoveButton removeButton = par.getRight();
            removeButton.setIndex(i);
            innerPanel.add(removeButton, new Float(1));
            innerPanel.setPreferredSize(new Dimension(800, 25));
            innerPanel.setMaximumSize(new Dimension(800, 25));
            parameterPane.add(innerPanel);
        }
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(1, 2));
        buttonPanel.setPreferredSize(new Dimension(800, 25));
        buttonPanel.setMaximumSize(new Dimension(800, 25));
        buttonPanel.add(addButton);
        buttonPanel.add(codeGenerationButton);

        parameterPane.add(buttonPanel);
        parameterPane.repaint();
        parameterScrollPane.repaint();
    }

    public void generateStub() {
        List<SpecifiedParameter> codeParameters = viewInteraction.getCodeParameters();
        StringBuilder sb = new StringBuilder();
        sb.append("fun <- function(");
        for (int i = 0; i < codeParameters.size(); ++i) {
            sb.append(codeParameters.get(i).getName());
            if (i != codeParameters.size() - 1)
                sb.append(", ");

        }
        sb.append(")\n{\n\n\n}");
        codeArea.setText(sb.toString());
    }

    public List<SpecifiedParameter> retriveData() {
        List<SpecifiedParameter> paramteres = new ArrayList<>();
        for (Pair<ParameterDescription, RemoveButton> param : parameterList) {

            SpecifiedParameter spec = new SpecifiedParameter();
            spec.setName(param.getLeft().getName());
            spec.setLowerBound(param.getLeft().getLowerBound());
            spec.setUpperBound(param.getLeft().getUpperBound());
            paramteres.add(spec);
        }
        return paramteres;
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
        ComponentWithLabel name;
        ComponentWithLabel lowerBound;
        ComponentWithLabel upperBound;

        public ParameterDescription() {
            setLayout(new RelativeLayout(RelativeLayout.X_AXIS));

            name = new ComponentWithLabel(createNameTextField(), "Name");
            lowerBound = new ComponentWithLabel(createBoundTextField(), "Lower bound");
            upperBound = new ComponentWithLabel(createBoundTextField(), "Upper bound");
            add(name, new Float(1));
            add(lowerBound, new Float(2));
            add(upperBound, new Float(2));
        }

        JTextField createBoundTextField() {
            JFormattedTextField field = new JFormattedTextField(ExecutionConditionPanel.fractalFormatter);
            field.setText("0.00");
            field.setColumns(6);
            return new JTextField();
        }

        JTextField createNameTextField() {
            JTextField field = new JTextField();
            field.setColumns(8);
            return field;
        }

        @Override
        public String getName() {
            return name.getComponentText();
        }

        public Double getLowerBound() {
            return Double.parseDouble(lowerBound.getComponentText());
        }

        public Double getUpperBound() {
            return Double.parseDouble(upperBound.getComponentText());
        }

    }

    class RemoveButton extends JButton {
        int index;

        public RemoveButton() {
            super("Remove");
            addActionListener(l -> viewInteraction.removeParameter(index));
        }

        public void setIndex(int i) {
            index = i;
        }
    }

    class AddButton extends JButton {
        public AddButton() {
            super("Add");
            addActionListener(l -> viewInteraction.addParameter());
        }
    }

    class GenerationButton extends JButton {
        public GenerationButton() {
            super("Generate");
            addActionListener(l -> viewInteraction.generateCode());
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
