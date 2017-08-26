‘ 以下为VB Demo 函数引用说明
Public Declare Function InitialUSB_IO Lib "hDTD.dll" () As Long
Public Declare Sub ExistUSB_IO Lib "hDTD.dll" ()
Public Declare Function PickUp Lib "hDTD.dll" () As Long
Public Declare Function PutDown Lib "hDTD.dll" () As Long
Public Declare Function DialNmb Lib "hDTD.dll" (ByVal lpszNote As String) As Long
Public Declare Function Read_Call_Nmb Lib "hDTD.dll" (ByVal lpszNote As String) As Long
Public Declare Sub TelSleep Lib "hDTD.dll" (ByVal iDelay As Integer)
Public Declare Function StartReadSound Lib "hDTD.dll" (ByVal lpszNote As String, ByVal iMode As Integer) As Long
Public Declare Function StopReadSound Lib "hDTD.dll" () As Long
Public Declare Function SetDialPara Lib "hDTD.dll" (ByVal DialDelay As Integer, ByVal betweenDialDelay As Integer, ByVal iDecay As Integer) As Long
Public Declare Function SetNextCallDelay Lib "hDTD.dll" (ByVal betweenDialDelay As Integer) As Long
Public Declare Function ReaddiFlagsValue Lib "hDTD.dll" () As Long
Public Declare Function StartPlaySound Lib "hDTD.dll" (ByVal cReadName As String, ByVal iStartPlayPos As Integer, ByVal iDirct As Integer, ByVal iDecay As Integer, ByVal iMute As Integer) As Long
Public Declare Function StopPlaySound Lib "hDTD.dll" () As Long
Public Declare Function GetWriteSoundRate Lib "hDTD.dll" () As Long

Public Declare Function CheckCallStatus Lib "hDTD.dll" () As Long
Public Declare Function CheckCanNextCallIn Lib "hDTD.dll" () As Long
Public Declare Function CheckPutDown Lib "hDTD.dll" () As Long

Public Declare Function IfNotCompleteInitUSB Lib "hDTD.dll" ()
Public Declare Function IfConnectUSB Lib "hDTD.dll" () As Long
Public Declare Function ClearCallBit Lib "hDTD.dll" ()



' 以下为VB Demo程序原代码
' 强烈建议：在编译成.exe文件后，再调试接入器程序。
'           使用Read_Call_Nmb(strCallNmb)函数，strCallNmb类型为char[]

Dim m_bTelInfoIfExist As Boolean
Dim m_bNextCallCanInto As Boolean
Dim m_bPickUp As Boolean
Dim m_bDialNmbNow As Boolean
Dim m_bIsPlayInPhoneNow As Boolean
Dim m_iPlayMode As Byte

Private Sub Form_Load()
    Dim iTelStatus As Long
    Dim iReturnValue As Long

    m_bTelInfoIfExist = False                           ' 还没有连接HM设备

    If (InitialUSB_IO() > 0) Then                       ' InitialUSB_IO()在整个程序体中，只能执行一次；如果2次执行该过程，.dll内会报错
        IfNotCompleteInitUSB                            ' 等待HM工作正常
        If IfConnectUSB() = 1 Then                      ' 再次读入HM状态
            m_bTelInfoIfExist = False                   ' 本变量用于保存HM是否已经连接状态，为后续操作提供判断，一定要有。
            MsgBox "话媒(HM)没有连接好！您不能正常使用HM!"
        Else
            m_bPickUp = False                           ' 没有摘机
            m_bTelInfoIfExist = True
            m_bDialNmbNow = False
            m_iPlayMode = 0                             ' 电话放音
            ClearCallBit
            iReturnValue = SetDialPara(5, 5, 6)         ' 拨号延时100mS，拨号时间间隔为100mS，单位：20mS
            SetNextCallDelay (100)                      ' 设置下次来电进入时间间隔为10S, 单位：100mS
        End If

        PickUpCall.Enabled = False
        m_bNextCallCanInto = True                       ' 下次来电可以进入
        m_bIsPlayInPhoneNow = False                     ' 没有在电话放音中
    End If
End Sub
Private Sub Form_Unload(Cancel As Integer)
    If m_bTelInfoIfExist = True Then
        ExistUSB_IO
    End If
End Sub
Private Sub ButtonDial_Click()
    Dim iFileSize As Long
    Dim iRecStatus As Long
    Dim strFileSize As String

    If ButtonDial.Caption = "拨号" Then
        ButtonDial.Caption = "挂机"
        PickUp
        TelSleep (600)      ' 延时600mS拨号，等待摘机状态稳定
        DialNmb (strDialNmb.Text)
        iRecStatus = StartReadSound("Dial.wav", 0)

        m_bDialNmbNow = True
    Else
        iFileSize = StopReadSound()
        TelSleep (200)      ' 延时200mS停止
        PutDown
        m_bDialNmbNow = False
        ButtonDial.Caption = "拨号"
        strFileSize = iFileSize
        strRecordSize.Caption = "录音文件长度: " + strFileSize + "Bytes"
    End If
End Sub

Private Sub PickUpCall_Click()
    Dim iFileSize As Long
    Dim iRecStatus As Long
    Dim strFileSize As String

    If PickUpCall.Caption = "接听" Then
        PickUpCall.Caption = "挂机"
        m_bPickUp = True
        m_bNextCallCanInto = True
        PickUp
        TelSleep (100)      ' 延时100mS拨号，等待摘机状态稳定
        iRecStatus = StartReadSound("Call.wav", 0)
    Else
        iFileSize = StopReadSound()
        TelSleep (100)

        PutDown
        PickUpCall.Caption = "接听"
        m_bPickUp = False
        PickUpCall.Enabled = False
        strFileSize = iFileSize
        strCallRecSize.Caption = "录音文件长度: " + strFileSize + "Bytes"
    End If
End Sub

Private Sub PhonePlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If PhonePlay.Caption = "电话放音" Then
        MsgBox "电话摘机后，您会听到电话的放音+交换机送来的拨号音！这是正常现象。当您拨通一个电话后，该拨号音就不存在了，此时在电话放音，您才会听到正常的电话放音。"
        PhonePlay.Caption = "停止"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "电话放音文件:leaveword.wav"      ' leaveword.wav文件在当前工作目录下
        PickUp
        TelSleep (250)      ' 延时250mS放音
        m_iPlayMode = 1
        iStatus = StartPlaySound("leaveword.wav", 0, 0, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        TelSleep (100)      ' 延时100mS停止
        PutDown
        PhonePlay.Caption = "电话放音"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub EarPlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If EarPlay.Caption = "耳机放音" Then
        EarPlay.Caption = "停止"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "耳机放音文件:leaveword.wav"      ' leaveword.wav文件在当前工作目录下
        m_iPlayMode = 3
        iStatus = StartPlaySound("leaveword.wav", 0, 2, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        EarPlay.Caption = "耳机放音"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub SpeakPlay_Click()
    Dim iStatus As Long
    Dim bStatus As Boolean

    If SpeakPlay.Caption = "喇叭放音" Then
        SpeakPlay.Caption = "停止"
        m_bIsPlayInPhoneNow = True
        strPlayName.Caption = "喇叭放音文件:leaveword.wav"      ' leaveword.wav文件在当前工作目录下
        m_iPlayMode = 2
        iStatus = StartPlaySound("leaveword.wav", 0, 1, 2, 0)
    Else
        m_iPlayMode = 0
        bStatus = StopPlaySound()
        SpeakPlay.Caption = "喇叭放音"
        strPlayName.Caption = ""
        m_bIsPlayInPhoneNow = False
    End If

End Sub

Private Sub TelTimer_Timer()
    Dim iTelStatus As Long
    Dim strCallNmb As String * 60
    Dim iUSBStatus As Long
    Dim iStartPlayPos As Long
    Dim str450 As String * 3
    Dim str450DelayTime As String

    '检测是否有来电，并读出来电号码
     If CheckCallStatus() = 1 Then
         m_bNextCallCanInto = False
         m_iStatusUSB = Read_Call_Nmb(strCallNmb)
         strCallInfo.Caption = strCallNmb
         PickUpCall.Enabled = True
     End If

    ' 判断是否为下次来电
    If m_bNextCallCanInto = False Then
        If CheckCanNextCallIn() = 1 Then
            PickUpCall.Enabled = False
            m_bNextCallCanInto = True
        End If
    End If

    ' 检测话媒(HM)是否已经摘/挂机
    If m_bNextCallCanInto = False Then
        If m_bPickUp = False Then
            If CheckPutDown() = 1 Then              ' 当刚有来电时，判断是否有接听
                PickUpCall_Click
            End If
        End If
    Else
        If m_bPickUp = True Then                    ' 判断来电时，是否有挂机
            If CheckPutDown() = 0 Then
                PickUpCall_Click
            End If
        End If

        If m_bDialNmbNow = True Then        ' 判断拨号时，是否挂机
            If CheckPutDown() = 0 Then
                ButtonDial_Click
            End If
        End If
    End If

    '判断电话放音是否完成
    If m_bIsPlayInPhoneNow = True Then
        iStartPlayPos = GetWriteSoundRate()
//读放音长度比率,>0: 返回已经读出放音文件字节数与该文件总长度的比率0到1000
//=0: 该放音文件的长度为0Byte
//=-1: 由于Phone挂机，则由HM申请停止放音

        If iStartPlayPos >= 1000 Then
            If m_iPlayMode = 1 Then
                PhonePlay_Click
            End If
            If m_iPlayMode = 2 Then
                SpeakPlay_Click
            End If
            If m_iPlayMode = 3 Then
                EarPlay_Click
            End If
        End If
    End If

End Sub

Private Sub CSetPara_Click()
    Dim iNextCallDelay As Integer
    Dim iDailDelay As Integer
    Dim iBetweenDialDelay As Integer
    Dim iDialDecay As Integer
    Dim iReturnValue As Long

    iNextCallDelay = m_strCallDelay
    iDailDelay = m_strDailDelay
    iBetweenDialDelay = m_strBetweenDelay
    iDialDecay = m_strDialDecay

    ' 用于来电时，参数的设置
    ' 来电时，两个震铃之间的延时，这个延时长度，需要实地测量。这个参数一定要大于实地测量两个震铃之间的时间长度。
    ' intCallDelay=1,相当延时100mS; intCallDelay=100,则延时10S; intCallDelay的最大取值为240
    ' 如果intCallDelay延时小于来电时，两个震铃之间的时间间隔，那么，来电号码的提取会产生错误!
    SetNextCallDelay (iNextCallDelay)

    ' 用于拨号时，参数的设置
    ' 拨号时，两个号码拨出之间的延时。intBetweenDelay=1,相当延时20mS; intBetweenDelay=4,则延时80mS
    ' intBetweenDelay的最大取值为10
    ' 一个号码的延时预设置为5，相当于100mS
    iReturnValue = SetDialPara(iDailDelay, iBetweenDialDelay, iDialDecay)

End Sub
