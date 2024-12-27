import controlP5.*;

public class MenuBar {
  private ControlP5 cp5;
  private ListBox filesListBox;
  private int selectedFileIndex = -1;
  private int xPosition = 0;
  private int yPosition = 0;
  private String[] filenames;
  private int test;
 
  
  public MenuBar(PApplet p, String dataPath) {
    cp5 = new ControlP5(p);
    this.filenames = listFileNames(dataPath);
  }

  public void setXPosition(int x) {
    this.xPosition = x;
  }

  public void setYPosition(int y) {
    this.yPosition = y;
  }

  public int getSelectedFileIndex(){
    return selectedFileIndex;
  }
  
  public String getSelectedFileName(int selectedFileIndex){
    return filenames[selectedFileIndex];
  }
  

  public void init() {
    filesListBox = cp5.addListBox("filesList")
      .setPosition(xPosition, yPosition)   
        .setSize(120, 120)
          .setItemHeight(15)
            .setBarHeight(15)
              .setColorBackground(color(0))
                .setColorActive(color(50))
                  .setColorForeground(color(128));

    filesListBox.getCaptionLabel().toUpperCase(true);
    filesListBox.getCaptionLabel().set("Select file");
    filesListBox.getCaptionLabel().setColor(0xffff0000);
    filesListBox.getCaptionLabel().getStyle().marginTop = 3;
    
    if(this.filenames != null){
      for (int i=0; i< this.filenames.length; i++) {
        filesListBox.addItem(filenames[i], i);
      
     
      }
    }
    cp5.addButton("crosshatch")
      .setPosition(xPosition + 130, yPosition  )
        .setSize(60, 30)
          .setValue(0)
            .activateBy(ControlP5.RELEASE);


    cp5.addButton("contour")
      .setPosition(xPosition + 130 , yPosition + 30)
        .setSize(60, 30)
          .setValue(0)
            .activateBy(ControlP5.RELEASE);


    cp5.addButton("clear")
      .setPosition(xPosition + 130, yPosition + 60)
        .setSize(60, 30)
          .setValue(0)
            .activateBy(ControlP5.RELEASE);

 //******************SLIDER****************
   cp5.addSlider("Densidad")
     .setColorLabel(255)
     .setColorValue(color(0,40,90))
     .setPosition(960,25)
     .setSize(220,20)
     .setRange(1.0,100.0) // values can range from big to small as well
     .setValue(50)
     .setSliderMode(Slider.FLEXIBLE)
     .setNumberOfTickMarks(130)
    // .snapToTickMarks(true)
     ;

  //******************SLIDER****************
   cp5.addSlider("Scale")
     .setColorLabel(255)
     .setColorValue(color(0,40,90))
     .setPosition(960,75)
     .setSize(220,20)
     .setRange(1.0,100.0) // values can range from big to small as well
     .setValue(50)
     .setSliderMode(Slider.FLEXIBLE)
     .setNumberOfTickMarks(130)
    // .snapToTickMarks(true)
     ; 
            
      
  }
  


  public void controlEvent(ControlEvent theEvent) {
   // if (theEvent.isGroup() && theEvent.name().equals("filesList")) {
    //  selectedFileIndex = (int)theEvent.getGroup().getValue();
    if(theEvent.isFrom(cp5.getController("filesList"))){
    selectedFileIndex = int(theEvent.getController().getValue());
   // println("test "+test); 
    }
  }

  private String[] listFileNames(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      String names[] = file.list(new FilenameFilter() {
        @Override
          public boolean accept(File dir, String name) {
          return !name.startsWith(".");
        }
      }
      );

      return names;
    } else {
      // If it's not a directory
      return null;
    }
  }
}