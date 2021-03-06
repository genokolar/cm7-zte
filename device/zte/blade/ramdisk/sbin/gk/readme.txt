=================
【命令功能说明】
=================

/sbin/gk下一共6个命令，意义分别如下：

1-app2sd.sh-----app2sd状态切换开关，用于在开启/关闭/重开启APP2SD状态之间进行切换
   ---开启此命令，会自动判断当前APP2SD的状态，并进行状态的切换。
   ---未开启运行此开关将开启APP2SD；开启后运行此开关将关闭APP2SD；挂载失败后运行此开关将重开启APP2SD

2-data2ext.sh-----data2sd状态切换开关，用于在开启/关闭/重开启DATA2EXT状态之间进行切换
     ---使用方法同app2sd开关，不重述
     ---超频660不建议开启data2ext功能

3-swap.sh-----swap状态切换开关，用于开启/关闭SWAP功能
     ---实时开启，无需重启，重启后依然有效
     ---如果分了swap分区使用swap分区开启swap功能，如果没有分swap分区则在EXT分区建立swap.file文件开启swap功能
     ---相关参数请到system/etc/enhanced.conf中配置
     ---超频660内核是预留的开关，此功能无效

4、optimize.sh-----用于开启关闭系统程序优化功能（不再包括data/app下的程序)。
   ---关闭优化后再开启优化 = “手动优化”，更新升级程序后，程序会无法正常开启，建议更新升级程序后执行“手动优化”
   ---优化功能可能会导致程序出错，重启手机后可解决

5-backup.sh-----备份功能开启命令，用于开启数据备份
   ---开启此命令并根据提示完成操作，将自动备份当前数据。主要用于刷机前，也可用于平常备份程序数据/系统设置/通讯录等
   ---现在分为三种模式：0表示备份数据(不打包)到sd-ext分区；1表示备份数据(打包)到sdcard；2表示备份程序和数据(打包)到sdcard
   ---在0模式下，如果开启了data2ext的话，相当于备份了data与system数据，运行此命令只会备份wifi数据
   ---相关参数请到system/etc/enhanced.conf中配置


6-restore.sh-----还原功能开启命令，用于恢复备份数据
   ---开启此命令并根据提示完成操作，将自动恢复备份的数据。主要用于刷机后，恢复数据到刷机前，自动判断当前安装的程序，只恢复已安装的程序的数据
   ---现在分为三种模式：0表示备份数据(不打包)到sd-ext分区；1表示备份数据(打包)到sdcard；2表示备份程序和数据(打包)到sdcard
   ---在0模式下，如果开启了data2ext的话，无需还原data与system数据，运行此命令只会还原wifi数据
   ---相关参数请到system/etc/enhanced.conf中配置

==================
【命令使用方法】
==================

用RE文件管理器进入/sbin/gk目录，点击脚本，在弹出的对话框中选择执行，等待自动重启或等待提示。命令执行的时候会有屏幕自动关闭后无法点亮的问题，这个是因为脚本还在执行中，请等待一会儿，脚本执行完了就能开机了。脚本执行的时候可以用HOME（小房子）键返回桌面执行其他程序，等待它自行完成即可。

要重新刷入recovery.img可以直接复制recovery.img（必须更名为recovery.img，全部小写）到/system文件夹下，然后重启手机即可


要更改swap文件大小/放置位置，可以更改/system/etc/enhanced.conf文件中的对应数值
更改了swap文件大小数值后，如果已经建立了swap.file文件，需要先关闭swap功能，删除swap.file文件，重新开启swap来建立新设置大小的swap.file文件
swappiness设置的为swap优先率，减小swap的优先率能最大限度使用手机内存，以提高运行速度，并且减少对SD卡的读取，也就减小对SD卡的损耗