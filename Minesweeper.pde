import de.bezier.guido.*;
private int NUM_ROWS = 25;
private int NUM_COLS = 25;
private int NUN_BOMBS = 40;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined
public int ok;
public int ko;

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int a = 0; a < NUM_ROWS; a++)
    {
        for(int b = 0; b < NUM_COLS; b++)
        {
        buttons[a][b] = new MSButton(a,b);
        }
    }
    bombs = new ArrayList <MSButton>();
    setBombs();
}
public void setBombs()
{
    for(int e = 0; e < 25; e++)
    {
        int ok = (int)(Math.random()*NUM_ROWS);
        int ko = (int)(Math.random()*NUM_COLS);
            if(!(bombs.contains(buttons[ok][ko])))
            {
                bombs.add(buttons[ok][ko]);
            }
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r < NUM_ROWS && c < NUM_COLS && r >= 0 && c >= 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
            if(bombs.contains(buttons[row-1][col-1])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row][col-1])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row+1][col-1])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row-1][col])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row+1][col])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row-1][col+1])) 
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row][col+1]))
            {
                numBombs = numBombs + 1;
            }
            if(bombs.contains(buttons[row+1][col+1])) 
            {
                numBombs = numBombs + 1;
            }
        return numBombs;
    }
}



