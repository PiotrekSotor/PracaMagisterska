package panels;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.text.NumberFormatter;

import org.springframework.util.StringUtils;

import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class FunctionSelectionPanel extends MainPanel {

    private static final String CODE_LABEL = "(code)";
    private java.awt.List functionsList;

    public FunctionSelectionPanel(ViewInteraction vi, NumberFormatter fractalFormatter) {
        super(vi);

        addSelectFunction();
    }

    private void addSelectFunction() {

        functionsList = new java.awt.List();
        functionsList.setMultipleMode(false);
        functionsList.add("Schaffer nr 2");
        functionsList.add("Paviani");
        functionsList.add("ZeldaSine10");
        functionsList.add(CODE_LABEL);
        functionsList.addItemListener(new ItemListener() {

            @Override
            public void itemStateChanged(ItemEvent e) {
                String selectedItem = ((java.awt.List) e.getSource()).getSelectedItem();
                viewInteraction.enableRCodeTab(StringUtils.pathEquals(selectedItem, CODE_LABEL));
                if (StringUtils.pathEquals(selectedItem, CODE_LABEL))
                    Context.getInstance().setSelectedFunction("fun");
                else
                    Context.getInstance().setSelectedFunction(selectedItem);
            }
        });
        add(new ComponentWithLabel(functionsList, "Test function"));
    }

}
