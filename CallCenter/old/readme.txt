运行之前请先注册OcxDTD.ocx控件!方法如下：
注册: regsvr32 路径\PhoneOcx.ocx
撤销注册: regsvr32 /u 路径\PhoneOcx.ocx

网页起始文件：index.html

以下是功能调用：
PickUp()：摘机
HandUp()：挂机
DialNmbCStr("486735316")：拨号
StartReadSoundCStr("C:\\PhoneOcx.wav")：开始录音
StopReadSound()：停止录音
GetTelStatus()：读接入器状态
SetTelStatus(200 * 256)：设置接入器状态
ReadstrCallNmb()：读来电号码
TelSleep(iDelay): 为.html网页提供的一个延时函数，您也可以使用其它网页中的函数
GetWriteSoundRate(): 返回放音已经放音文件长度的比率，从0到1000。0：还没有放音；1000:已经放音完成。

各个函数的定义和在应用层中的调用，请参见VB_API和《hDLL接口定义.doc》说明书。
您在使用过程中，有什么问题，请及时与我联系。

Tel: 010-51281984, 86735316
www.telshp.com
