public class bubblePlotCon {

   public static final Integer normalValue = 100;

   Bubble[] bubbles;
   Integer selectedX;
   Integer selectedY;
   Integer width;
   Integer height;

   public Integer getPlotWidth() { return width;}
   public void setPlotWidth(Integer w) { this.width = w;}
   public Integer getPlotHeight() { return height; }
   public void setPlotHeight(Integer h) { this.height = h; }

   public Integer getSelectedX() { return selectedX; }
   public Integer getSelectedY() { return selectedY; }
   public void setSelectedX(Integer x) { this.selectedX = x; }
   public void setSelectedY(Integer y) { this.selectedY = y; }
  
   public void setComponentBubbles(Bubble[] bubbles) {
     Double low = 0.0;
     Double high = 0.0;
     for(Bubble b:bubbles) {
       if(b.getSize() > high) high = b.getSize();
       if(b.getSize() < low) low = b.getSize();
     }
     for(Bubble b:bubbles) {
       b.setSize(high,low);
     } 
     this.bubbles = bubbles; 
   }

   public Bubble[] getComponentBubbles() {       
     for(Bubble b:bubbles) {
       b.setWidth(width);
       b.setHeight(height);
     }
     return bubbles;
   }

   private Integer normalizeValue(Double original, Integer dimension, Double size) {
     Double p = original * (dimension/BubblePlotCon.normalValue);
     return p + size > dimension ? (dimension - size).intValue() : p.intValue();
   }
 
   public void bubbleClick() {
      for (bubble b:bubbles) {
        if(normalizeValue(b.getX(),width,b.getSizeDrawn()) == selectedX && normalizeValue(b.getY(),height,b.getSizeDrawn()) == selectedY) {
          b.setisselected(true);
        } else {
          b.setIsSelected(false);
        }
      }
   }
}