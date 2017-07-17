package panels;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JButton;

import SystemMessages.ErrorSystemMessage;
import guiInterface.ViewInteraction;
import main.Context;

public class PlotPanel extends MainPanel {

    private JButton prev;
    private JButton next;

    private BufferedImage image;

    public PlotPanel(ViewInteraction vi) {
        super(vi);
        setPreferredSize(new Dimension(800, 600));

        prev = new JButton("Previous");
        next = new JButton("Next");

        prev.addActionListener(l -> viewInteraction.printPrevious());
        next.addActionListener(l -> viewInteraction.printNext());

        prev.setEnabled(false);
        next.setEnabled(false);

        add(prev);
        add(next);

        setBackground(Color.cyan);

        addComponentListener(new ResizeListener());
    }

    public void paintWithImage(String path) {
        try {
            image = ImageIO.read(new File(path));
            prev.setEnabled(viewInteraction.hasPrev());
            next.setEnabled(viewInteraction.hasNext());
        } catch (IOException e) {
            throw new ErrorSystemMessage("Cannot open file with plot");
        }
        repaint();

    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0, this); // see javadoc for more info on the
                                        // parameters
    }

    class ButtonActionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            // TODO Auto-generated method stub

        }
    }

    public class ResizeListener implements ComponentListener {

        @Override
        public void componentResized(ComponentEvent e) {
            Dimension size = e.getComponent().getSize();
            // PlotFunctionParameters plotFunctionParameters =
            // Context.getInstance().getPlotFunctionParameters();
            Context.getInstance().setPlotDimensions(e.getComponent().getSize());

            System.out.println("PlotPanel resized: " + e.getComponent().getSize().toString());
        }

        @Override
        public void componentMoved(ComponentEvent e) {
        }

        @Override
        public void componentShown(ComponentEvent e) {
        }

        @Override
        public void componentHidden(ComponentEvent e) {
        }

    }
}
