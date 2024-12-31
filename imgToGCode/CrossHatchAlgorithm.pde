
class CrossHatchAlgorithm {
  private String imageName;
 // private int fin_linea = 0;
  private int fin_lineax = 0;
  private int fin_lineay = 0;
 // private int desde = 1;
  private int desdex = 0;
  private int desdey = 0;
 // private int largo;

  private int x=0;
  private int y=0;
 // private float j=0;
//private int k=0;
  private int cant = 0;
  private float densidad = 20.0;
  private float escala = 20.0;
  private PrintWriter output;

  public CrossHatchAlgorithm(String name, float densidad, float escala) {

    this.imageName = name;
    this.densidad = densidad;
    this.escala = escala;
  }


  /*
   private float escala = 3.3; //PARA ARCHIVO 800 X 600 : A3 2.5 A4 3.3
   private float Scale = 30.0;
   
   private int paso_real = int(7 * (1 + ((100 - scale)/100)));
   
   
   */
  //***********************************
  float coef = 1.0;


  public void drawCyan(String colourName, String imagePath, int red, int green, int blue ) {
    beginRecord(SVG, svgs+"/"+imageName+"_cian.svg");
    int paso_real = int(7 * (coef + ((100 - densidad)/100)));
    //println("paso: "+paso_real);
    cant = 0;
    PImage colourImage = loadImage(imagePath);

    output = createWriter(gcodePath + "/" + imageName+"_"+colourName+".gcode");

    output.println("G21 G90");
    output.println("M92 Z1600.0");
    output.println("G28");
    output.println("G0 F500");
    output.println("G0 Z4.5");
    output.println("M1 Put pen and click");


    lineLtoR(colourImage, 0.0, 25.0, paso_real, 1, 10, red, green, blue, 1, 1);
    lineRtoL(colourImage, 0.0, 50.0, paso_real, 1, 10, red, green, blue, 1, 1);
    lineLtoR(colourImage, 0.0, 75.0, paso_real, 1, 10, red, green, blue, 2, 1);
    lineRtoL(colourImage, 0.0, 100.0, paso_real, 1, 10, red, green, blue, 2, 1);
    lineLtoR(colourImage, 0.0, 125.0, paso_real, 1, 10, red, green, blue, 3, 1);
    lineRtoL(colourImage, 0.0, 150.0, paso_real, 1, 10, red, green, blue, 3, 1);
    lineLtoR(colourImage, 0.0, 175.0, paso_real, 1, 10, red, green, blue, 4, 1);
    lineRtoL(colourImage, 0.0, 200.0, paso_real, 1, 10, red, green, blue, 4, 1);
    lineRtoL(colourImage, 0.0, 225.0, paso_real, 1, 10, red, green, blue, 5, 1);
    lineLtoR(colourImage, 0.0, 250.0, paso_real, 1, 10, red, green, blue, 5, 1);


    output.println("G0 Z0.0");
    output.println("G0 X0.0 Y0.0");
    // output.println("G0 Z5.0");
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
    endRecord();
    println(cant);
  }

  //********************

  //***********************************

  public void drawMagenta(String colourName, String imagePath, int red, int green, int blue ) {
    beginRecord(SVG, svgs+"/"+imageName+"_magenta.svg");
    int paso_real = int(7 * (coef + ((100 - densidad)/100)));

    cant = 0;
    PImage colourImage = loadImage(imagePath);

    output = createWriter(gcodePath + "/" + imageName+"_"+colourName+".gcode");
    output.println("G21 G90");
    output.println("M92 Z1600.0");
    output.println("G28");
    output.println("G0 F500");
    output.println("G0 Z4.5");
    output.println("M1 Put pen and click");

    lineLtoR(colourImage, 0.0, 25.0, paso_real, 1, 10, red, green, blue, 1, 1);
    lineRtoL(colourImage, 0.0, 50.0, paso_real, 1, 10, red, green, blue, 1, 1);
    lineLtoR(colourImage, 0.0, 75.0, paso_real, 1, 10, red, green, blue, 1, 2);
    lineRtoL(colourImage, 0.0, 100.0, paso_real, 1, 10, red, green, blue, 1, 2);
    lineLtoR(colourImage, 0.0, 125.0, paso_real, 1, 10, red, green, blue, 1, 3);
    lineRtoL(colourImage, 0.0, 150.0, paso_real, 1, 10, red, green, blue, 1, 3);
    lineLtoR(colourImage, 0.0, 175.0, paso_real, 1, 10, red, green, blue, 1, 4);
    lineRtoL(colourImage, 0.0, 200.0, paso_real, 1, 10, red, green, blue, 1, 4);
    lineRtoL(colourImage, 0.0, 225.0, paso_real, 1, 10, red, green, blue, 1, 5);
    lineLtoR(colourImage, 0.0, 250.0, paso_real, 1, 10, red, green, blue, 1, 5);


    output.println("G0 Z0.0");
    output.println("G0 X0.0 Y0.0");
    // output.println("G0 Z5.0");
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
    endRecord();
    println(cant);
  }

  //********************

  //***********************************

  public void drawYellow(String colourName, String imagePath, int red, int green, int blue ) {
    beginRecord(SVG, svgs+"/"+imageName+"_yellow.svg");
    int paso_real = int(7 * (coef + ((100 - densidad)/100)));
    cant = 0;
    PImage colourImage = loadImage(imagePath);

    output = createWriter(gcodePath + "/" + imageName+"_"+colourName+".gcode");
    output.println("G21 G90");
    output.println("M92 Z1600.0");
    output.println("G28");
    output.println("G0 F500");
    output.println("G0 Z4.5");
    output.println("M1 Put pen and click");

    lineLtoR(colourImage, 0.0, 25.0, paso_real, 1, 10, red, green, blue, 1, 2);
    lineRtoL(colourImage, 0.0, 50.0, paso_real, 1, 10, red, green, blue, 1, 2);
    lineLtoR(colourImage, 0.0, 75.0, paso_real, 1, 10, red, green, blue, 2, 2);
    lineRtoL(colourImage, 0.0, 100.0, paso_real, 1, 10, red, green, blue, 2, 2);
    lineLtoR(colourImage, 0.0, 125.0, paso_real, 1, 10, red, green, blue, 3, 2);
    lineRtoL(colourImage, 0.0, 150.0, paso_real, 1, 10, red, green, blue, 3, 2);
    lineLtoR(colourImage, 0.0, 175.0, paso_real, 1, 10, red, green, blue, 4, 2);
    lineRtoL(colourImage, 0.0, 200.0, paso_real, 1, 10, red, green, blue, 4, 2);
    lineRtoL(colourImage, 0.0, 225.0, paso_real, 1, 10, red, green, blue, 5, 2);
    lineLtoR(colourImage, 0.0, 250.0, paso_real, 1, 10, red, green, blue, 5, 2);


    output.println("G0 Z0.0");
    output.println("G0 X0.0 Y0.0");
    // output.println("G0 Z5.0");
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
    endRecord();
    println(cant);
  }

  //********************

  public void drawBlack(String colourName, String imagePath, int red, int green, int blue ) {
    beginRecord(SVG, svgs+"/"+imageName+ "_black.svg");
    int paso_real = int(7 * (coef + ((100 - densidad)/100)));
    cant = 0;
    PImage colourImage = loadImage(imagePath);

    output = createWriter(gcodePath + "/" + imageName+"_"+colourName+".gcode");
    output.println("G21 G90");
    output.println("M92 Z1600.0");
    output.println("G28");
    output.println("G0 F500");
    output.println("G0 Z4.5");
    output.println("M1 Put pen and click");

    lineLtoR(colourImage, 0.0, 25.0, paso_real, 1, 5, red, green, blue, 1, 0);
    lineRtoL(colourImage, 0.0, 50.0, paso_real, 1, 5, red, green, blue, 1, 0);
    lineLtoR(colourImage, 0.0, 75.0, paso_real, 1, 5, red, green, blue, 2, 0);
    lineRtoL(colourImage, 0.0, 100.0, paso_real, 1, 5, red, green, blue, 2, 0);
    lineLtoR(colourImage, 0.0, 125.0, paso_real, 1, 5, red, green, blue, 3, 0);
    lineRtoL(colourImage, 0.0, 150.0, paso_real, 1, 5, red, green, blue, 3, 0);
    lineLtoR(colourImage, 0.0, 175.0, paso_real, 1, 5, red, green, blue, 4, 0);
    lineRtoL(colourImage, 0.0, 200.0, paso_real, 1, 5, red, green, blue, 4, 0);
    lineLtoR(colourImage, 0.0, 225.0, paso_real, 1, 5, red, green, blue, 5, 0);
    lineLtoR(colourImage, 0.0, 250.0, paso_real, 1, 5, red, green, blue, 5, 0);
    output.println("G0 Z0.0");
    output.println("G0 X0.0 Y0.0");
    // output.println("G0 Z5.0");
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
    endRecord();
    println(cant);
  }


  //********************lineLtoR --> rayasd3

  public void lineLtoR(PImage img, float lim_inf, float lim_sup, int paso, int trazo, int largo_min, int rojo, int verde, int azul, int deltax, int deltay)
  {
    int sentido = 1;
    float escala = 100 / Scale;

    x=0+paso-deltax;
    y=img.height+deltay-2;
    fin_lineax = img.width;
    fin_lineay = img.height;
    desdex = -img.height;
    desdey = 0;
    for (int z=-img.height; z < img.width*escala; z=z+paso)

    {


      if (z <= 0)
      {

        y=(z*-1)+deltay;
        x=0+deltax;
      } else
      {
        y=0+deltay;
        x=z+deltax;
      }


      while (y < img.height-1 && x < img.width-1)
      {

        int pos = y*img.width + x;
        float val = brightness(img.pixels[pos]);

        desdex = x;
        desdey = y;
        fin_lineax = x;
        fin_lineay = y;

        if ( val >= lim_inf && val <= lim_sup)
        {
          while ( val >= lim_inf && val <= lim_sup && x > 0  && y < img.height-1 && x < img.width)
          {
            pos = y*img.width + x;
            val = brightness(img.pixels[pos]);
            fin_lineax = fin_lineax+1;
            fin_lineay = fin_lineay+1;
            x++;
            y++;
          }

          stroke(rojo, verde, azul);
          strokeWeight(trazo);
          if (dist(desdex, desdey, fin_lineax, fin_lineay) > largo_min) {
            //if ((fin_lineax - desdex) > largo_min) {
            line(desdex/escala, desdey/escala, fin_lineax/escala, fin_lineay/escala);
            output.println("G0 F500");
            output.println("G0 Z0.0");
            output.println("G0 F8000");
            output.println("G1 X" + desdex/escala +" Y"+ desdey/escala );
            output.println("G0 F500");
            output.println("G0 Z5.0");
            output.println("G0 F8000");
            output.println("G1 X" + fin_lineax/escala + " Y" + fin_lineay/escala);
            output.println("G0 F500");

            cant++;
          }
        } else
        {
          x++;
          y++;
        }
      }/////////
      sentido = sentido * -1;
    }
  }


  //*******************************lineRtoL --> rayasd2
  public void lineRtoL(PImage img, float lim_inf, float lim_sup, int paso, int trazo, int largo_min, int rojo, int verde, int azul, int deltax, int deltay)
  {
    int sentido = 1;
    float escala = 100 / Scale;
    x=0-deltax+img.width;

    y=img.height+deltay;
    fin_lineax = img.width;
    fin_lineay = 0;
    desdex = img.width+img.height;
    desdey = 0;
    for (int z=img.height+img.width; z > 0; z=z-paso)

    {


      if (z > img.width)
      {

        y=z-img.width+deltay;
        x=img.width+deltax;
      } else
      {
        y=0+deltay;
        x=z+deltax;
      }


      while (y < img.height-1 && x > 0)
      {

        int pos = y*img.width + x;

        float val = brightness(img.pixels[pos]);


        desdex = x;
        desdey = y;
        fin_lineax = x;
        fin_lineay = y;
        if (desdex - img.width-1 > 0 || fin_lineax < 10)
        {
          val = 0.0;
        }



        if ( val >= lim_inf && val <= lim_sup)
        {
          while ( val >= lim_inf && val <= lim_sup && x > 0 && y < img.height-1 && x > 0)
          {
            pos = y*img.width + x;
            val = brightness(img.pixels[pos]);
            fin_lineax = fin_lineax-1;
            fin_lineay = fin_lineay+1;
            x--;
            y++;
          }

          stroke(rojo, verde, azul);
          strokeWeight(trazo);
          if (dist(desdex, desdey, fin_lineax, fin_lineay) > largo_min) {
            //if ((desdex - fin_lineax) > largo_min) {
            line(desdex/escala, desdey/escala, fin_lineax/escala, fin_lineay/escala);

            output.println("G0 F500");
            output.println("G0 Z0.0");
            output.println("G0 F8000");
            output.println("G1 X" + desdex/escala +" Y"+ desdey/escala );
            output.println("G0 F500");
            output.println("G0 Z5.0");
            output.println("G0 F8000");
            output.println("G1 X" + fin_lineax/escala + " Y" + fin_lineay/escala);
            output.println("G0 F500");

            cant++;
          }
        } else
        {
          x--;
          y++;
        }
      }
    }
  }
}
