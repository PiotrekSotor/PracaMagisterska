package panels;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Arrays;

import javax.swing.text.NumberFormatter;

import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class ScenarioSelectionPanel extends MainPanel {

    private java.awt.List scenariosList;

    public ScenarioSelectionPanel(ViewInteraction vi, NumberFormatter propabilityFormatter,
            NumberFormatter integerFormatter) {
        super(vi);

        addTextFields(propabilityFormatter, integerFormatter);
    }

    private void addTextFields(NumberFormatter propabilityFormatter, NumberFormatter integerFormatter) {
        scenariosList = new java.awt.List();
        // scenariosList.set
        scenariosList.setMultipleMode(true);
        scenariosList.add("[1-2 4-5 3-6]");
        scenariosList.add("[4-5 3-6 1-2]");
        scenariosList.add("[3-6 1-2 4-5]");
        scenariosList.add("[1-6 2-4 3-5]");
        scenariosList.add("[1-2-3 4-5-6]");
        scenariosList.add("[4-5-6 1-2-3]");

        scenariosList.addItemListener(new ItemListener() {

            @Override
            public void itemStateChanged(ItemEvent e) {
                String[] selectedItem = ((java.awt.List) e.getSource()).getSelectedItems();
                viewInteraction.enablePerformSelection(selectedItem.length);
                Context.getInstance().setSelectedScenarios(Arrays.asList(selectedItem));

            }
        });
        add(new ComponentWithLabel(scenariosList, "<html>Memetic algorithm<br>parameter selection</html>"));
    }

}
