public class bubble {
     public enum Color {GRAY, RED, BLUE, YELLOW }
     private enum Size { TINY, SMALL, MEDIUM, LARGE }

     Map<String,Integer> sizeMap = new Map<String, Integer>{Bubble.Size.TINY.name() => 15, 
                                                            Bubble.Size.SMALL.name() => 20,
                                                            Bubble.Size.Medium.name() => 30,
                                                            Bubble.Size.Large.Name() => 45};
     Double magnitude;
     Integer x;
     Integer y;
     String name;
     String imagePath;
     Color color;
     Size size;
     boolean selected = false;
     Integer width;
     Integer height;
     Id id;

     public Bubble(String name, Integer x, Integer y, Double size) { 
       this.name = name;
       this.x = x;
       this.y = y; 
       this.magnitude = size;
     }

     public Integer getSizeDrawn() { return sizeMap.get(size.name()); }
 
     public Id getId() { return id; }
     public void setId(Id id) { this.id = id; }
     public void setWidth(Integer w) { this.width = w; }
     public void setHeight(Integer h) { this.height = h; }
     public void setX(Integer x) { this.x = x; }
     public void setY(Integer y) { this.y = y; }

     public Integer getX() { return x; }
     public Integer getY() { return y; }
     public Double getSize() { return magnitude; }
     public void setSize(Double high, Double low) {
       Double range = high - low;
       if(magnitude < low + (.25 * range)) size = Bubble.Size.TINY;
       else if (magnitude < low + (.5 * range)) size = Bubble.Size.SMALL;
       else if (magnitude < low + (.75 * range)) size = Bubble.Size.MEDIUM;
       else size = Bubble.Size.LARGE;
     }
     public String getName() { return name; }
     public Boolean getIsSelected() { return selected; }
     public String getImagePath() {
       imagePath = 'gray';
       if(color != null) imagePath = color.name().toLowerCase();
       imagePath += '/';
       imagePath += size.name().toLowerCase();
       if(selected) imagePath += '_selected';
       imagePath += '.png';

       return imagePath; 
     }
     public void setColor(Color c) { this.color = c; }
     public Color getColor() { return color; }
     public void setIsSelected(Boolean b) {selected = b;}

     public Integer getNormalizedXValue() {
       Integer p = x * (width/BubblePlotCon.normalValue);
       return p + sizeMap.get(size.name()) > width ? width - sizeMap.get(size.name()) : p;
     }

     public Integer getNormalizedYValue() {
       Integer p = y * (height/BubblePlotCon.normalValue);
       return p + sizeMap.get(size.name()) > height ? height - sizeMap.get(size.name()) : p;
     }
       
   }