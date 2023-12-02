pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Pro 22.1 (20220109-103)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_day01b" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#a8ff7281#;
   pragma Export (C, u00001, "day01bB");
   u00002 : constant Version_32 := 16#2e11c0b1#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#eb6e0dda#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#7a7a1ff8#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#70e6d3cc#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#19b42e05#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#fc9377ef#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#a2da961d#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#adf22619#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#f86e3391#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#7aded4c1#;
   pragma Export (C, u00012, "system__secondary_stackB");
   u00013 : constant Version_32 := 16#458fe2ff#;
   pragma Export (C, u00013, "system__secondary_stackS");
   u00014 : constant Version_32 := 16#9f9b27c5#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#f37611b0#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#8f19dc19#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#ce3e0e21#;
   pragma Export (C, u00018, "system__soft_links__initializeB");
   u00019 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00019, "system__soft_links__initializeS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#2c65fdf5#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#b1e67ab7#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#fc140986#;
   pragma Export (C, u00024, "system__exceptionsS");
   u00025 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00025, "system__exceptions__machineB");
   u00026 : constant Version_32 := 16#59a6462e#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#92c2ea31#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#1253e556#;
   pragma Export (C, u00029, "system__img_intS");
   u00030 : constant Version_32 := 16#01838199#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#e2576046#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#1f08c83e#;
   pragma Export (C, u00032, "system__traceback_entriesB");
   u00033 : constant Version_32 := 16#8472457c#;
   pragma Export (C, u00033, "system__traceback_entriesS");
   u00034 : constant Version_32 := 16#4287f9c5#;
   pragma Export (C, u00034, "system__traceback__symbolicB");
   u00035 : constant Version_32 := 16#4f57b9be#;
   pragma Export (C, u00035, "system__traceback__symbolicS");
   u00036 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00036, "ada__containersS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#bba159a5#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#edec285f#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#fb01eaa4#;
   pragma Export (C, u00040, "interfaces__cB");
   u00041 : constant Version_32 := 16#65fe712b#;
   pragma Export (C, u00041, "interfaces__cS");
   u00042 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00042, "system__bounded_stringsB");
   u00043 : constant Version_32 := 16#d527b704#;
   pragma Export (C, u00043, "system__bounded_stringsS");
   u00044 : constant Version_32 := 16#fdcdcac1#;
   pragma Export (C, u00044, "system__crtlS");
   u00045 : constant Version_32 := 16#f64b5fd2#;
   pragma Export (C, u00045, "system__dwarf_linesB");
   u00046 : constant Version_32 := 16#abc8cfe6#;
   pragma Export (C, u00046, "system__dwarf_linesS");
   u00047 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00047, "ada__charactersS");
   u00048 : constant Version_32 := 16#55d8d23c#;
   pragma Export (C, u00048, "ada__characters__handlingB");
   u00049 : constant Version_32 := 16#f0ae79d3#;
   pragma Export (C, u00049, "ada__characters__handlingS");
   u00050 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00050, "ada__characters__latin_1S");
   u00051 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00051, "ada__stringsS");
   u00052 : constant Version_32 := 16#d324fbf6#;
   pragma Export (C, u00052, "ada__strings__mapsB");
   u00053 : constant Version_32 := 16#88df9e15#;
   pragma Export (C, u00053, "ada__strings__mapsS");
   u00054 : constant Version_32 := 16#9097e839#;
   pragma Export (C, u00054, "system__bit_opsB");
   u00055 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00055, "system__bit_opsS");
   u00056 : constant Version_32 := 16#89dde28e#;
   pragma Export (C, u00056, "system__unsigned_typesS");
   u00057 : constant Version_32 := 16#047daaea#;
   pragma Export (C, u00057, "ada__strings__maps__constantsS");
   u00058 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00058, "system__address_imageB");
   u00059 : constant Version_32 := 16#03360b27#;
   pragma Export (C, u00059, "system__address_imageS");
   u00060 : constant Version_32 := 16#d5cc70e4#;
   pragma Export (C, u00060, "system__img_unsS");
   u00061 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00061, "system__ioB");
   u00062 : constant Version_32 := 16#3c986152#;
   pragma Export (C, u00062, "system__ioS");
   u00063 : constant Version_32 := 16#06253b73#;
   pragma Export (C, u00063, "system__mmapB");
   u00064 : constant Version_32 := 16#c8dac3e3#;
   pragma Export (C, u00064, "system__mmapS");
   u00065 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00065, "ada__io_exceptionsS");
   u00066 : constant Version_32 := 16#ff7fe6a1#;
   pragma Export (C, u00066, "system__mmap__os_interfaceB");
   u00067 : constant Version_32 := 16#4856845e#;
   pragma Export (C, u00067, "system__mmap__os_interfaceS");
   u00068 : constant Version_32 := 16#c4762d35#;
   pragma Export (C, u00068, "system__mmap__unixS");
   u00069 : constant Version_32 := 16#04c90d6d#;
   pragma Export (C, u00069, "system__os_libB");
   u00070 : constant Version_32 := 16#52088caf#;
   pragma Export (C, u00070, "system__os_libS");
   u00071 : constant Version_32 := 16#aaa0b2a8#;
   pragma Export (C, u00071, "system__atomic_operations__test_and_setB");
   u00072 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00072, "system__atomic_operations__test_and_setS");
   u00073 : constant Version_32 := 16#65b9ec38#;
   pragma Export (C, u00073, "system__atomic_operationsS");
   u00074 : constant Version_32 := 16#d8591cd2#;
   pragma Export (C, u00074, "system__atomic_primitivesB");
   u00075 : constant Version_32 := 16#a48adac0#;
   pragma Export (C, u00075, "system__atomic_primitivesS");
   u00076 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00076, "system__case_utilB");
   u00077 : constant Version_32 := 16#9d0f2049#;
   pragma Export (C, u00077, "system__case_utilS");
   u00078 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#ee9775cf#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#2e823f49#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#4d58338b#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#7f3a47d4#;
   pragma Export (C, u00082, "system__val_lliS");
   u00083 : constant Version_32 := 16#945fbd74#;
   pragma Export (C, u00083, "system__val_lluS");
   u00084 : constant Version_32 := 16#879d81a3#;
   pragma Export (C, u00084, "system__val_utilB");
   u00085 : constant Version_32 := 16#0e7a20e3#;
   pragma Export (C, u00085, "system__val_utilS");
   u00086 : constant Version_32 := 16#992dbac1#;
   pragma Export (C, u00086, "system__exception_tracesB");
   u00087 : constant Version_32 := 16#a0f69396#;
   pragma Export (C, u00087, "system__exception_tracesS");
   u00088 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00088, "system__wch_conB");
   u00089 : constant Version_32 := 16#b9a7b4cf#;
   pragma Export (C, u00089, "system__wch_conS");
   u00090 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00090, "system__wch_stwB");
   u00091 : constant Version_32 := 16#94b698ce#;
   pragma Export (C, u00091, "system__wch_stwS");
   u00092 : constant Version_32 := 16#1f681dab#;
   pragma Export (C, u00092, "system__wch_cnvB");
   u00093 : constant Version_32 := 16#b6100e3c#;
   pragma Export (C, u00093, "system__wch_cnvS");
   u00094 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00094, "system__wch_jisB");
   u00095 : constant Version_32 := 16#3660171d#;
   pragma Export (C, u00095, "system__wch_jisS");
   u00096 : constant Version_32 := 16#dd2b2c52#;
   pragma Export (C, u00096, "ada__strings__fixedB");
   u00097 : constant Version_32 := 16#b8cf4ffc#;
   pragma Export (C, u00097, "ada__strings__fixedS");
   u00098 : constant Version_32 := 16#0772993a#;
   pragma Export (C, u00098, "ada__strings__searchB");
   u00099 : constant Version_32 := 16#81eb6890#;
   pragma Export (C, u00099, "ada__strings__searchS");
   u00100 : constant Version_32 := 16#8c178268#;
   pragma Export (C, u00100, "ada__strings__text_buffersB");
   u00101 : constant Version_32 := 16#0800bb5e#;
   pragma Export (C, u00101, "ada__strings__text_buffersS");
   u00102 : constant Version_32 := 16#cd3494c7#;
   pragma Export (C, u00102, "ada__strings__utf_encodingB");
   u00103 : constant Version_32 := 16#37e3917d#;
   pragma Export (C, u00103, "ada__strings__utf_encodingS");
   u00104 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00104, "ada__strings__utf_encoding__wide_stringsB");
   u00105 : constant Version_32 := 16#103ad78c#;
   pragma Export (C, u00105, "ada__strings__utf_encoding__wide_stringsS");
   u00106 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00106, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00107 : constant Version_32 := 16#91eda35b#;
   pragma Export (C, u00107, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00108 : constant Version_32 := 16#b3f0dfa6#;
   pragma Export (C, u00108, "ada__tagsB");
   u00109 : constant Version_32 := 16#cb8ac80c#;
   pragma Export (C, u00109, "ada__tagsS");
   u00110 : constant Version_32 := 16#5534feb6#;
   pragma Export (C, u00110, "system__htableB");
   u00111 : constant Version_32 := 16#261825f7#;
   pragma Export (C, u00111, "system__htableS");
   u00112 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00112, "system__string_hashB");
   u00113 : constant Version_32 := 16#84464e89#;
   pragma Export (C, u00113, "system__string_hashS");
   u00114 : constant Version_32 := 16#4bad597c#;
   pragma Export (C, u00114, "ada__strings__text_buffers__unboundedB");
   u00115 : constant Version_32 := 16#dda14c72#;
   pragma Export (C, u00115, "ada__strings__text_buffers__unboundedS");
   u00116 : constant Version_32 := 16#81dac2b0#;
   pragma Export (C, u00116, "ada__strings__utf_encoding__conversionsB");
   u00117 : constant Version_32 := 16#1b7c377a#;
   pragma Export (C, u00117, "ada__strings__utf_encoding__conversionsS");
   u00118 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00118, "ada__strings__utf_encoding__stringsB");
   u00119 : constant Version_32 := 16#fe1d64b5#;
   pragma Export (C, u00119, "ada__strings__utf_encoding__stringsS");
   u00120 : constant Version_32 := 16#ca8c282d#;
   pragma Export (C, u00120, "system__finalization_mastersB");
   u00121 : constant Version_32 := 16#c318aa02#;
   pragma Export (C, u00121, "system__finalization_mastersS");
   u00122 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00122, "ada__finalizationS");
   u00123 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00123, "ada__streamsB");
   u00124 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00124, "ada__streamsS");
   u00125 : constant Version_32 := 16#5fc04ee2#;
   pragma Export (C, u00125, "system__put_imagesB");
   u00126 : constant Version_32 := 16#dff4266b#;
   pragma Export (C, u00126, "system__put_imagesS");
   u00127 : constant Version_32 := 16#e264263f#;
   pragma Export (C, u00127, "ada__strings__text_buffers__utilsB");
   u00128 : constant Version_32 := 16#608bd105#;
   pragma Export (C, u00128, "ada__strings__text_buffers__utilsS");
   u00129 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00129, "system__finalization_rootB");
   u00130 : constant Version_32 := 16#ed28e58d#;
   pragma Export (C, u00130, "system__finalization_rootS");
   u00131 : constant Version_32 := 16#35d6ef80#;
   pragma Export (C, u00131, "system__storage_poolsB");
   u00132 : constant Version_32 := 16#d9ac71aa#;
   pragma Export (C, u00132, "system__storage_poolsS");
   u00133 : constant Version_32 := 16#cf7bfc56#;
   pragma Export (C, u00133, "ada__strings__unboundedB");
   u00134 : constant Version_32 := 16#cddac869#;
   pragma Export (C, u00134, "ada__strings__unboundedS");
   u00135 : constant Version_32 := 16#a1d6147d#;
   pragma Export (C, u00135, "system__compare_array_unsigned_8B");
   u00136 : constant Version_32 := 16#0bd9e790#;
   pragma Export (C, u00136, "system__compare_array_unsigned_8S");
   u00137 : constant Version_32 := 16#a8025f3c#;
   pragma Export (C, u00137, "system__address_operationsB");
   u00138 : constant Version_32 := 16#b1d6282e#;
   pragma Export (C, u00138, "system__address_operationsS");
   u00139 : constant Version_32 := 16#cb532bfc#;
   pragma Export (C, u00139, "system__atomic_countersB");
   u00140 : constant Version_32 := 16#7ec279de#;
   pragma Export (C, u00140, "system__atomic_countersS");
   u00141 : constant Version_32 := 16#c9a3fcbc#;
   pragma Export (C, u00141, "system__stream_attributesB");
   u00142 : constant Version_32 := 16#414158da#;
   pragma Export (C, u00142, "system__stream_attributesS");
   u00143 : constant Version_32 := 16#3e25f63c#;
   pragma Export (C, u00143, "system__stream_attributes__xdrB");
   u00144 : constant Version_32 := 16#ce9a2a0c#;
   pragma Export (C, u00144, "system__stream_attributes__xdrS");
   u00145 : constant Version_32 := 16#61e84971#;
   pragma Export (C, u00145, "system__fat_fltS");
   u00146 : constant Version_32 := 16#47da407c#;
   pragma Export (C, u00146, "system__fat_lfltS");
   u00147 : constant Version_32 := 16#3d0aee96#;
   pragma Export (C, u00147, "system__fat_llfS");
   u00148 : constant Version_32 := 16#956d4365#;
   pragma Export (C, u00148, "filehandlingB");
   u00149 : constant Version_32 := 16#411ef105#;
   pragma Export (C, u00149, "filehandlingS");
   u00150 : constant Version_32 := 16#ff1f6112#;
   pragma Export (C, u00150, "text_ioS");
   u00151 : constant Version_32 := 16#828c91b9#;
   pragma Export (C, u00151, "ada__text_ioB");
   u00152 : constant Version_32 := 16#381871e7#;
   pragma Export (C, u00152, "ada__text_ioS");
   u00153 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00153, "interfaces__c_streamsB");
   u00154 : constant Version_32 := 16#066a78a0#;
   pragma Export (C, u00154, "interfaces__c_streamsS");
   u00155 : constant Version_32 := 16#7eaaf28f#;
   pragma Export (C, u00155, "system__file_ioB");
   u00156 : constant Version_32 := 16#de785348#;
   pragma Export (C, u00156, "system__file_ioS");
   u00157 : constant Version_32 := 16#84962885#;
   pragma Export (C, u00157, "system__file_control_blockS");
   u00158 : constant Version_32 := 16#de53e0a3#;
   pragma Export (C, u00158, "ada__containers__helpersB");
   u00159 : constant Version_32 := 16#229b07a5#;
   pragma Export (C, u00159, "ada__containers__helpersS");
   u00160 : constant Version_32 := 16#fb575acb#;
   pragma Export (C, u00160, "ada__containers__stable_sortingB");
   u00161 : constant Version_32 := 16#f29ff792#;
   pragma Export (C, u00161, "ada__containers__stable_sortingS");
   u00162 : constant Version_32 := 16#021224f8#;
   pragma Export (C, u00162, "system__pool_globalB");
   u00163 : constant Version_32 := 16#29da5924#;
   pragma Export (C, u00163, "system__pool_globalS");
   u00164 : constant Version_32 := 16#fa5bafc8#;
   pragma Export (C, u00164, "system__memoryB");
   u00165 : constant Version_32 := 16#fba7f029#;
   pragma Export (C, u00165, "system__memoryS");
   u00166 : constant Version_32 := 16#8e7c94d7#;
   pragma Export (C, u00166, "system__storage_pools__subpoolsB");
   u00167 : constant Version_32 := 16#8393ab70#;
   pragma Export (C, u00167, "system__storage_pools__subpoolsS");
   u00168 : constant Version_32 := 16#cafa918a#;
   pragma Export (C, u00168, "system__storage_pools__subpools__finalizationB");
   u00169 : constant Version_32 := 16#8bd8fdc9#;
   pragma Export (C, u00169, "system__storage_pools__subpools__finalizationS");
   u00170 : constant Version_32 := 16#f819c43c#;
   pragma Export (C, u00170, "system__strings__stream_opsB");
   u00171 : constant Version_32 := 16#ec029138#;
   pragma Export (C, u00171, "system__strings__stream_opsS");
   u00172 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00172, "system__concat_2B");
   u00173 : constant Version_32 := 16#a07a41cd#;
   pragma Export (C, u00173, "system__concat_2S");
   u00174 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00174, "system__concat_3B");
   u00175 : constant Version_32 := 16#a9aacab8#;
   pragma Export (C, u00175, "system__concat_3S");
   u00176 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00176, "system__concat_4B");
   u00177 : constant Version_32 := 16#dcbebd3d#;
   pragma Export (C, u00177, "system__concat_4S");
   u00178 : constant Version_32 := 16#236b2bc2#;
   pragma Export (C, u00178, "system__val_intS");
   u00179 : constant Version_32 := 16#28959a26#;
   pragma Export (C, u00179, "system__val_unsS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.atomic_operations%s
   --  system.img_int%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.containers.stable_sorting%s
   --  ada.containers.stable_sorting%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.conversions%s
   --  ada.strings.utf_encoding.conversions%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  ada.strings.text_buffers.unbounded%s
   --  ada.strings.text_buffers.unbounded%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_uns%s
   --  system.val_int%s
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  text_io%s
   --  filehandling%s
   --  filehandling%b
   --  day01b%b
   --  END ELABORATION ORDER

end ada_main;
