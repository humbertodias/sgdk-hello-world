#include <genesis.h>

char textoTela[23] = "Primeiro Game do dipi!";

int main(u16 hard)
{
    //VDP_drawText("Ola Mundo!", 10, 13);

    //Desabilita acesso ao VDP
    SYS_disableInts();

    VDP_init();
    SPR_init();
    VDP_setScreenWidth320();
    VDP_setScreenHeight224();

    /*
    while(TRUE)
    {
        // read input
        // move sprite
        // update score
        // draw current screen (logo, start screen, settings, game, gameover, credits...)
       
        // wait for screen refresh and do all SGDK VBlank tasks
        SYS_doVBlankProcess();
    }
    */

    //Resabilita acesso ao VDP    
    SYS_enableInts();

    return 0;
}