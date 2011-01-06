/*
 * Copyright (c) 2010 Falanxia a.s.
 */

package com.falanxia.utilitaris.display.atlasanim.director {
import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;

/**
 *
 *
 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
 * @since
 */
public class GlobalAtlasAnimDirector {

    public static var INSTANCE:GlobalAtlasAnimDirector;

    private var director:IAtlasDirector;


    /**
     * Constructor.
     */
    public function GlobalAtlasAnimDirector(s:SEnf) {
        if (!s) throw new Error("GlobalAtlasAnimDirector class is a singleton; use getInstance() instead.");
    }


    public static function getInstance():GlobalAtlasAnimDirector {
        if (!INSTANCE) INSTANCE = new GlobalAtlasAnimDirector(new SEnf());
        return INSTANCE;
    }


    public function init(director:IAtlasDirector):void {
        this.director = director;
    }


    public function destroy():void {
        director.destroy();
        director = null;
    }

    public function getDirector():IAtlasDirector {
        return director;
    }



}
}


class SEnf {
}