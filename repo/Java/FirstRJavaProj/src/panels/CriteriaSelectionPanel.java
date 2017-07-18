package panels;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.text.NumberFormatter;

import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class CriteriaSelectionPanel extends MainPanel {

    JRadioButton crit1Button;
    JRadioButton crit2Button;
    JRadioButton crit3Button;
    JRadioButton crit4Button;

    public CriteriaSelectionPanel(ViewInteraction vi, NumberFormatter propabilityFormatter) {
        super(vi);

        crit1Button = new JRadioButton("Criterion nr 1");
        crit1Button.setSelected(true);
        crit2Button = new JRadioButton("Criterion nr 2");
        crit3Button = new JRadioButton("Criterion nr 3");
        crit4Button = new JRadioButton("Criterion nr 4");

        crit1Button.addActionListener(new RadioButtonListener("Criterion nr 1"));
        crit2Button.addActionListener(new RadioButtonListener("Criterion nr 2"));
        crit3Button.addActionListener(new RadioButtonListener("Criterion nr 3"));
        crit4Button.addActionListener(new RadioButtonListener("Criterion nr 4"));

        ButtonGroup bg = new ButtonGroup();
        bg.add(crit1Button);
        bg.add(crit2Button);
        bg.add(crit3Button);
        bg.add(crit4Button);

        JPanel buttons = new JPanel();
        buttons.setLayout(new GridLayout(2, 2));
        buttons.add(crit1Button);
        buttons.add(crit2Button);
        buttons.add(crit3Button);
        buttons.add(crit4Button);

        add(new ComponentWithLabel(buttons, "Comparison criteria"));
    }

    class RadioButtonListener implements ActionListener {

        String name;

        public RadioButtonListener(String n) {
            name = n;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            System.out.println(name);
            Context.getInstance().setSelectedCriterion(name);
        }

    }
}
