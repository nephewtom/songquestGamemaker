// Script assets have changed for v2.3.0 see

function draw_text_outlined(xx, yy, outSize, outColor, inColor, text) {

    draw_text_outlined_ext(xx, yy, outSize, outColor, inColor, text, -1, 10000);
}

function draw_text_outlined_ext(xx, yy, outSize, outColor, inColor, text, sep, w) {

    //Outline  
    draw_set_color(outColor);  
    draw_text_ext(xx+outSize, yy+outSize, text, sep, w);
    draw_text_ext(xx-outSize, yy-outSize, text, sep, w);  
    draw_text_ext(xx,   yy+outSize, text, sep, w);  
    draw_text_ext(xx+outSize,   yy, text, sep, w);  
    draw_text_ext(xx,   yy-outSize, text, sep, w);  
    draw_text_ext(xx-outSize,   yy, text, sep, w);  
    draw_text_ext(xx-outSize, yy+outSize, text, sep, w);  
    draw_text_ext(xx+outSize, yy-outSize, text, sep, w);  

    //Text  
    draw_set_color(inColor);
    draw_text_ext(xx, yy, text, sep, w);  
}

function draw_text_colour_outline(x, y, text, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle) {
    var i;
    for (i = 0; i < 360; i += 360 / outlineQuality){
        draw_text_transformed_color(x + lengthdir_x(outlineThickness, i), y + lengthdir_y(outlineThickness, i), text, xscale, yscale, angle, outlineColor1, outlineColor1, outlineColor2, outlineColor2, outlineAlpha);
    }
    draw_text_transformed_color(x, y, text, xscale, yscale, angle, textColor1, textColor1, textColor2, textColor2, textAlpha);
}