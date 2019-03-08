﻿// Copyright (c) Cragon. All rights reserved.

namespace Cs
{
    using System.Collections;
    using System.Collections.Generic;
    using UnityEngine;

    public class Main
    {
        //-------------------------------------------------------------------------
        static Context Context { get; set; }

        //-------------------------------------------------------------------------
        public static void Create(string platform, bool is_editor_debug)
        {
            Context = new Context();
            Context.Create(platform, is_editor_debug);
        }

        //-------------------------------------------------------------------------
        public static void Destroy()
        {
            Context.Destroy();
        }

        //-------------------------------------------------------------------------
        public static void Update()
        {
            Context.Update();
        }
    }
}
