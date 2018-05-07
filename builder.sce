// Copyright (C) 2008 - INRIA
// Copyright (C) 2009-2011 - DIGITEO

// This file is released under the 3-clause BSD license. See COPYING-BSD.

mode(-1);
lines(0);

function main_builder()
    TOOLBOX_NAME  = "ias";
    TOOLBOX_TITLE = "IAS";
    toolbox_dir   = get_absolute_file_path("builder.sce");

    // Check Scilab's version
    // =============================================================================

    try
        v = getversion("scilab");
    catch
        error(gettext("Scilab 6 or more is required."));
    end

    if v(1) < 6  then
        // new API in scilab 5.3
        error(gettext("Scilab 6 or more is required."));
    end

    // Check modules_manager module availability
    // =============================================================================

    if ~isdef("tbx_build_loader") then
        error(msprintf(gettext("%s module not installed."), "modules_manager"));
    end

    // Action
    // =============================================================================

    tbx_builder_macros(toolbox_dir);
    //tbx_builder_src(toolbox_dir);
    //tbx_builder_gateway(toolbox_dir);
    tbx_build_localization(toolbox_dir);
    //tbx_builder_help(toolbox_dir);
    tbx_build_loader(toolbox_dir);
    //tbx_build_cleaner(toolbox_dir);
    
    
    //Carregar %IASSTRUCT_p do arquivo .SCI
    txt = mgetl(toolbox_dir + 'loader.sce');
    txt = [txt;...
          'root_tlbx = get_absolute_file_path(''loader.sce'')';...
          'exec(root_tlbx + ''macros/%IASSTRUCT_p.sci'',-1);';...
          'clear root_tlbx;'];
       
    mputl(txt,toolbox_dir + 'loader.sce');

endfunction
// =============================================================================
main_builder();
clear main_builder; // remove main_builder on stack
// =============================================================================


