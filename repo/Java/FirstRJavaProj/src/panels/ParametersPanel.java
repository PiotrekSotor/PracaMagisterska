package panels;

import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JLabel;

import guiInterface.ViewInteraction;
import main.Context;
import params.GeneticParameters;
import params.MemeticParameters;
import params.PSOParameters;

public class ParametersPanel extends MainPanel {

    JLabel memeticDefault;
    JLabel memeticGauss;
    JLabel geneticDefault;
    JLabel geneticGauss;
    JLabel pso;

    public ParametersPanel(ViewInteraction vi) {
        super(vi);
        setLayout(new GridLayout(0, 1));

        memeticDefault = new JLabel();
        memeticGauss = new JLabel();
        geneticDefault = new JLabel();
        geneticGauss = new JLabel();
        pso = new JLabel();

        Font font = new Font("Serif", Font.PLAIN, 12);

        memeticDefault.setFont(font);
        memeticGauss.setFont(font);
        geneticDefault.setFont(font);
        geneticGauss.setFont(font);
        pso.setFont(font);

        add(memeticDefault);
        add(memeticGauss);
        add(geneticDefault);
        add(geneticGauss);
        add(pso);

        refreshParametersLabels();
    }

    public void refreshParametersLabels() {
        memeticDefault.setText(createMemeticLabel(Context.getInstance().getMemeticDefaultParameters()));
        memeticGauss.setText(createMemeticLabel(Context.getInstance().getMemeticGaussParameters()));

        geneticDefault.setText(createGeneticLabel(Context.getInstance().getGeneticDefaultParameters()));
        geneticGauss.setText(createGeneticLabel(Context.getInstance().getGeneticGaussParameters()));

        pso.setText(createPSOLabel(Context.getInstance().getPsoParameters()));
    }

    private String createPSOLabel(PSOParameters psoParameters) {
        StringBuilder sb = new StringBuilder();
        sb.append("Algorytm PSO: ");
        sb.append("pSize=");
        sb.append(psoParameters.getPopsize());
        sb.append(", phi1=");
        sb.append(psoParameters.getPhi1());
        sb.append(", phi2=");
        sb.append(psoParameters.getPhi2());
        sb.append(", inertiaWeight=");
        sb.append(psoParameters.getInertiaWeight());
        return sb.toString();
    }

    private String createGeneticLabel(GeneticParameters geneticDefaultParameters) {
        StringBuilder sb = new StringBuilder();
        createPart(geneticDefaultParameters, sb);
        return sb.toString();
    }

    private String createMemeticLabel(MemeticParameters memeticDefaultParameters) {
        StringBuilder sb = new StringBuilder();
        createPart(memeticDefaultParameters, sb);
        sb.append(", poptim=");
        sb.append(memeticDefaultParameters.getPoptim());
        sb.append(", pressel=");
        sb.append(memeticDefaultParameters.getPressel());
        sb.append(", method=");
        sb.append(memeticDefaultParameters.getMethod());
        return sb.toString();

    }

    private void createPart(GeneticParameters memeticDefaultParameters, StringBuilder sb) {
        if (memeticDefaultParameters instanceof MemeticParameters)
            sb.append("Algorytm memetyczny - ");
        else
            sb.append("Algorytm geneticzny - ");
        sb.append(memeticDefaultParameters.getMutationOperator());
        sb.append(": pSize=");
        sb.append(memeticDefaultParameters.getPopsize());
        sb.append(", pmut=");
        sb.append(memeticDefaultParameters.getpMutation());
        sb.append(", pcross=");
        sb.append(memeticDefaultParameters.getpCrossover());
    }

}
