<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>

<%
String khbh=(String)session.getAttribute("khbh");
String khlx=(String) session.getAttribute("khlx");// �ͻ����ͣ�0001����ѯ�ͻ� 0002��ǩԼ�ͻ�(2006-06-29)
khlx="0002";

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String fgsbh=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String sjs=null;
String xmzy=null;
String gcjdmc=null;
String cxhdbm=null;
String sfzhm=null;

String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String ybysxmbm=null;
String sybgcrq=null;
String zqysxmbm=null;
String szqsj=null;


String sjsdh="";
String bzdh="";
String zjdh="";
String xmzydh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	if(khlx.equals("0002")){// �ͻ����ͣ�0001����ѯ�ͻ� 0002��ǩԼ�ͻ�(2006-06-29)
		ls_sql="select khxm,lxfs,fwdz,hth,fgsbh,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,sjs,xmzy,gcjdmc,cxhdbm";
		ls_sql+=" ,kgrq,jgrq,sjkgrq,sjjgrq,a.gcyszxmmc ybysxmbm,sybgcrq,b.gcyszxmmc zqysxmbm,szqsj,sfzhm";
		ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
		ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
		ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			kgrq=cf.fillHtml(rs.getDate("kgrq"));
			jgrq=cf.fillHtml(rs.getDate("jgrq"));
			sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
			sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
			ybysxmbm=cf.fillHtml(rs.getString("ybysxmbm"));
			sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
			zqysxmbm=cf.fillHtml(rs.getString("zqysxmbm"));
			szqsj=cf.fillHtml(rs.getDate("szqsj"));

			khxm=cf.fillHtml(rs.getString("khxm"));
			lxfs=cf.fillHtml(rs.getString("lxfs"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			hth=cf.fillHtml(rs.getString("hth"));
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			dwbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sjs=cf.fillNull(rs.getString("sjs"));
			xmzy=cf.fillNull(rs.getString("xmzy"));
			gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
			cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
			sfzhm=cf.fillHtml(rs.getString("sfzhm"));
		}
		rs.close();
		ps.close();

		//���ʦ�绰
		ls_sql=" select '��'||dh||'��' dh from sq_yhxx";
		ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sjsdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//�೤�绰
		ls_sql=" select '��'||dh||'��' dh from sq_bzxx";
		ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bzdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//�ʼ�绰
		ls_sql=" select '��'||dh||'��' dh ";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zjdh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();

		//��ĿרԱ�绰
		ls_sql=" select '��'||dh||'��' dh ";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+xmzy+"' and zwbm='10'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmzydh=cf.fillNull(rs.getString("dh"));
		}
		rs.close();
		ps.close();
	}else if(khlx.equals("0001")){// �ͻ����ͣ�0001����ѯ�ͻ� 0002��ǩԼ�ͻ�(2006-06-29)

	}
	else
	{
	}


%>

<LINK REL="stylesheet" HREF="../images/stype.css" TYPE="text/css">
<link href="../css/h-g.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0">
<TABLE WIDTH=1004 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD> <IMG SRC="../images/top1_1-1.jpg" WIDTH=297 HEIGHT=5 ALT=""></TD>
  </TR>
  <TR> 
    <TD><table width="1004" height="66" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23"><img src="../images/top01.jpg" width="23" height="66"></td>
          <td width="190"><img src="../images/top1_2-1.jpg" width="190" height="66"></td>
          <td width="615"><div align="center"></div></td>
          <td width="176" valign="top"> <table width="124" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="49"><a href="../index.asp"><img src="../images/top1_2-1_1.jpg" width="83" height="16" border="0"></a></td>
                <td width="65"><a href="../bbs/"><img src="../images/top1_2-1_2.jpg" width="86" height="16" border="0"></a></td>
              </tr>
            </table>
            <table width="174" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td height="17" valign="bottom"> <div align="center"><a href="english/html/jieshao.html">Ӣ�İ� 
                    <strong>��English��</strong></a></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="../images/top1_3.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="25" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="23" background="../images/top01-1.jpg"><table width="23" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="817" background="../images/top1_4-2.jpg" class="css"> <TABLE align=right border=0 width=714>
              <TBODY>
                <TR> 
                  <TD width=708> <DIV align=center class=css><a href="/khhdpt/khxx/HhxxIndex.jsp">�ҵ�����</a> 
                      | <a href="/khhdpt/jzbj/JzbjIndex.jsp">��װ����</a> | <a href="/khhdpt/zytx/ZytxIndex.jsp">��Ҫ����</a> | <a href="/khhdpt/klzx/KlzxIndex.jsp">����װ��</a> 
                      | <a href="/khhdpt/zxjz/ZxjzIndex.jsp">�Ҽ�װ�޽�չ</a> | <a href="/khhdpt/gmjccp/khhdpt.html">���򼯳ɲ�Ʒ</a> 
                      | <a href="/khhdpt/yhys/khhdpt.html">�л�Ҫ˵ </a>| <a href="/khhdpt/wgpj/WgpjIndex.jsp">�깤����</a> | <a href="/khhdpt/yjdc/YjdcIndex.jsp">�ͻ�����</a> 
                      | <a href="/khhdpt/xgmm/XgmmIndex.jsp">�޸�����</a> </DIV></TD>
                </TR>
              </TBODY>
            </TABLE></td>
          <td width="164" bgcolor="#000000" class="css"> <table width="164" height="25" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td><div align="center"></div></td>
              </tr>
            </table></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <table width="1004" height="116" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="22" background="../images/top01-1.jpg"><table width="23" height="116" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="982" bgcolor="2E2E2E"> <img src="../images/top1_5-1.jpg" width="981" height="116"></td>
        </tr>
      </table></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="../images/top1_6.jpg" WIDTH=1004 HEIGHT=4 ALT=""></TD>
  </TR>
</TABLE>
<TABLE WIDTH=1001 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD COLSPAN=3> 
      <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="16"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="652">
            <table width="817" height="27" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td bgcolor="#DFDFDF">&nbsp;</td>
              </tr>
            </table>
          </td>
          <td width="336" bgcolor="#9A9A9A">&nbsp;</td>
        </tr>
      </table>
    </TD>
  </TR>
  <TR> 
    <TD width="23" height="863" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
    <TD width="287" valign="top" background="../images/index_3-2.jpg"> 
      <table width="282" height="50%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="153" valign="top"> 
            <table width="282" height="61%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="589" valign="top"> 
                  <div align="center"> 
                    <table width="198" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="192">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="184" valign="top"> 
                          <div align="center"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="258" height="172">
                              <param name="movie" value="../images/x-1.swf">
                              <param name="quality" value="high">
                              <embed src="../images/x-1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="258" height="172">
                              </embed>
                            </object> </div>
                        </td>
                      </tr>
                      <tr> 
                        <td height="0"><img src="../images/xuxian.jpg" width="277" height="11"></td>
                      </tr>
                    </table>
                    <table width="269" height="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="10" height="399">&nbsp;</td>
                        <td width="259" valign="top"> 
                          <table width="137" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="10" height="32">&nbsp;</td>
                              <td width="117" valign="bottom"><img src="../images/x-3.jpg" width="101" height="23"></td>
                            </tr>
                          </table>
                          <table width="259" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="../khxx/HhxxIndex.jsp">�� �� �� ��</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../zytx/ZytxIndex.jsp">�� Ҫ �� ��</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="/khhdpt/klzx/KlzxIndex.jsp">�� �� װ �� </a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="/khhdpt/zxjz/ZxjzIndex.jsp">�� �� װ �� �� չ</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="/khhdpt/gmjccp/khhdpt.html"> �� �� �� �� �� Ʒ</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../yhys/YhysIndex.jsp">�� �� Ҫ ˵</a></td>
                            </tr>
							<tr> 
                              <td width="24" height="26"> <div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td width="16" height="30">&nbsp;</td>
                              <td width="219"><a href="../wgpj/WgpjIndex.jsp">�� �� �� ��</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../yjdc/YjdcIndex.jsp">�� �� �� ��</a></td>
                            </tr>
							 <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="../xgmm/XgmmIndex.jsp">�� �� �� �� </a></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div align="left"></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div align="center"> </div>
    </TD>
    <TD width="694" valign="top"> 
      <table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> 
            <div align="left"><img src="../images/kl-zx.jpg" width="429" height="72"></div>
          </td>
        </tr>
        <tr> 
          <td valign="top"> <br>
<%//***************************************************************************************************
	if(khlx.equals("0001")){// �ͻ����ͣ�0001����ѯ�ͻ� 0002��ǩԼ�ͻ�(2006-06-29)
		out.print("<br><BR><CENTER><B>ϵͳ��ʾ:�Բ���!����û��ǩԼ,���ܽ��д˲���!</CENTER>");
		return;
	}
//*******************************************************************************************************
%>
            <table width="100%" border="0" height="834">
              <tr> 
                <td width="82%" valign="top"> 
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12;BORDER-COLLAPSE: collapse" >
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE" >����</td>
                      <td width="31%" ><%=khxm%>��<%=lxfs%>�� </td>
                      <td align="right" width="19%" >��ͬ��</td>
                      <td width="31%" ><%=hth%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE" >���֤����</td>
                      <td width="31%" ><%=sfzhm%></td>
                      <td align="right" width="19%" >�μӴ����</td>
                      <td width="31%" ><%=cxhdbm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE">���ݵ�ַ</td>
                      <td colspan="3"><%=fwdz%></td>
                    </tr>
                  </table>
                  <br>
                  <table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="26" colspan="4"><b>���ס���µ绰������Ϊ���������Ա�����ż��绰</b></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>ǩԼ����</b></td>
                      <td colspan="3"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
	%><%cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%>
                        <HR>
                        �����渺������ʦ����ͳһ�����ṩ��ϸ�ļ�װ��ѯ��������Э������ͻ������������⡣</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>���ʦ</b></td>
                      <td colspan="3"><%=sjs%><%=sjsdh%> 
                        <HR>
                        ������ͻ���ͨ��װ���Ҿӵ�ȫ����Ʒ�����Ѳ�鹤�ؿ�ʩ���ֳ���ԭ��Ʒ������Ǻ϶ȣ�Э���ͻ��������ڵ����������Э���깤������չ�����</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>ʩ����</b></td>
                      <td colspan="3"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
                        <HR>
                        ʩ������Ҫ��ˮ����ľ�����͹����߹����繤��ɣ����������ʦͼֽ��ɸ����ֵ��ֳ�ʩ����ҵ��</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>�ֳ��೤</b></td>
                      <td colspan="3"><%=sgbz%><%=bzdh%> 
                        <HR>
                        ʩ���೤����Ҫְ����Э�������֣����ƹ��̰����깤����ʩ���������ʦ���й�ͨ�����������ʦ�������ͼ��Э��ͳ�ﰲ�żҾӲ�Ʒ�Ľ���ʱ�估�ֳ�Э�����������ͻ��˽�ʩ�����̣��Ӷ����õ�˳�����ʩ����ҵ��</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>���̼���</b></td>
                      <td colspan="3"><%=zjxm%><%=zjdh%> 
                        <HR>
                        �����ڼ�鹤��������ල�������������ڽ��ȡ�</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>��ĿרԱ</b></td>
                      <td colspan="3"><%=xmzy%><%=xmzydh%> 
                        <HR>
                        �������ͻ��������ڴ﹫˾�����ļ��ɼҾӲ�Ʒ��������ʱ�˽����չ��ص�ʩ�����ȣ����ݹ����ֳ�����Э����ز��š���س��̣����ż��ɼҾӲ�Ʒ�Ĳ�������ơ����������͡���װ��ͳ�﹤��������ͻ����ڼ��ɼҾӲ�Ʒ��Ͷ�ߡ����ޣ�����ʱЭ����ز��š���س��̣����ٽ������ͻ��˶Լ��ɼҾ����Ѳ�Ʒ�Ľ����˲��������</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>��˾�ܻ�</b></td>
                      <td colspan="3">010-84291188</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>Ͷ�ߵ绰</b></td>
                      <td colspan="3">010-64201085��010-64200585 
                        <HR>
                        �ͷ���Ա������ʩ�������жԿͻ����лطã���ʵ��¼�ͻ���ӳ�����⣬����ʱ��������ز��ţ����ٽ��������ͻ���Ͷ�ߡ����ޣ�����ʱ��������ز��ţ����ٽ������ؽ�����ٶȼ����ȡ�</td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="2" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="21" colspan="4"><strong>�������̽���</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" height="25" align="right" bgcolor="#F1FCFE"><b>�������̽���</b></td>
                      <td colspan="3">
					  <BR>
					  <b>���ڿ55����</b>�� 
					  <BR><BR>
                        &nbsp;&nbsp;&nbsp;&nbsp;���ҹ涨��ͥװ�ι��̵����ڿ�Ϊ�����ܿ��55%��������ǩ���ͬ��ͬʱ�������ڿǮ����Խ���ǩ��ͬ���ڵ���Ӫ�����߹�˾���񲿣�ͬʱ��Ҫ���й�˾�����µ��վݡ�	
                        <P><b>���ڿ40����</b>�� 
						<BR><BR>
                          &nbsp;&nbsp;&nbsp;&nbsp;�ڰ����깤�����������������ڹ�����������ʼ�Ա��ʩ���ӡ��ͻ�������д���ͻ����������еġ�����Ԥ���㵥������ǩ��ȷ�ϡ��ͻ����ݡ�����Ԥ���㵥���еĽ������ڿ���ڿ�=��ͬ�����*40��+����������������ڿ����ǩ��ͬ���ڵ���Ӫ�����߹�˾���񲿣�����Ҫ���й�˾�����µ��վݡ�
                        <P><b>β�5����</b>�� 
						<BR><BR>
                          &nbsp;&nbsp;&nbsp;&nbsp;���̿������պϸ�󣬿ͻ�������β��ɵ���ǩ��ͬ���ڵ���Ӫ�����߹�˾���񲿣�����Ҫ���й�˾�����µ��վݡ�β����=5��*��ͬ�����+��������ͻ�������β�����˾�ܲ����񲿣���������ͬʱ�������޵������˶Լ��ɼҾ����ѽ��ڽ���β��ʱ����Я�����ļ�װ��ͬ�Լ����ͻ����������пͻ����ġ�����������Э���鼰������Ŀ��ϸ������˾��ܿ���������β���Ϊ��������ص�������	
					  <BR>&nbsp;
                      </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC" align="center"> 
                      <td height="21" colspan="4"><strong>���򼯳ɲ�Ʒָ��</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="19%" align="right" bgcolor="#F1FCFE"><b>�������ɲ�Ʒָ��</b></td>
                      <td colspan="3"> 
					  <BR>
                        ���ɲ�Ʒ��Ϊ�����ࣺ����ʽ��Ʒ��ľ�š����񡢼Ҿӣ����Ƕ���ʽ��Ʒ���ذ塢��ש�����ģ�</p>
                        <p>�����ڴＯ�ɲ�Ʒ�Ĵ����ƣ�</p>
                        <p><b>�Ը��Ի����Ϊ��ͷ��</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;��ͳ��װ��������������������ѽڣ�������ȫ�ﵽ��Ʒ�����Ԥ��Ч�����������ڴＯ�ɼҾ����ʦ�ܹ�Ϊ�ͻ��ṩװ�޵�ϸ����Ƽ��Ҿߡ����ϵ���������ƺͽ��飬����רҵ����������ͳһ��</p>
                        <p><b>�ÿͻ�ʡ�ģ�</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;�����ڴ︺��Э��ͳһ��ơ�ʩ����ѡ�ĺ����εȷ���������Ϊ�ͻ�ʡȥ���ڶ��鷳�������ڴＯ�ɲ�Ʒ�����ڶ�Ҿߡ����ϳ��̣��ṩ�������װ��ơ�ʩ�����Ҿ߲�Ʒ�з������������������ס��ṩ��һ���ȫ��λ�Ҿ߷���ģʽ��</p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;�����ڴ�����м��ɲ�Ʒ��ŵ�����⸶,һ�����ɹ������мӹ��������ڿͻ����е�ʩ���������ͷ۳�������������ȶ��˼���������Ⱦ����һ���棬����רְ���������ִ�й���ͳһ������׼����֤�����ԡ�</p>
                        <p><b>�ÿͻ�ʡʱ��</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;����װ�޲������廯ʩ����װ�޺ͼҾ߲�Ʒ����ͬʱ���У�������ҵ�����̹��ڡ��ڲ����乺���������ڶ���ϳ��̣��ͻ����ö������ߣ���ʡ����ʱ�䡣</p>
                        <p><b>�ÿͻ�ʡǮ��</b></p>
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;�����ڴ﹫˾�ڷ�չ�в������������β�ҵ����ͨ��ȫ�򻯲ɹ�����޶ȵĽ��Ͳɹ��ɱ���ͨ��ERP��Ϣ����ϵͳ�ľ�׼���񽵵���Ա�ɱ���ͨ��2020����ĸ�Ч��׼���������������ɱ���ͨ�����򻯹���ģʽ���������ɱ��͹���ɱ������ɴ˲������������ռ��������������ߡ�
					  <BR>&nbsp;
                      </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" colspan="4" align="center"><strong>����ʩ������</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="4" ><img src="����ʩ������.jpg" ></td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" align="center" colspan="2"><strong>�����ڴ�������</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="69%" align="center" ><img src="�ܲ���ͼ.jpg"></td>
                      <td width="31%" >
					  �����ڴ�Ҿӹ�
					  <P>��ַ�������г��������Ӻ�����23�ź�
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������2��
					  <P>�˳�������[������]վ������300��302
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������·��[���Ӻ�]վ�� 
                      <P>��������������·�Զ����������ں�ƽ
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����µ�ͷ�� 
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������·�����򶫣�̫������
					  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ�������ϸ�·������ </td>
                    </tr>
                  </table>
                  <BR>
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12; BORDER-COLLAPSE: collapse">
                    <tr bgcolor="#FFCCCC"> 
                      <td height="21" colspan="4" align="center"><strong>�����ڴ������λ��ͼ</strong></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="4" ><img src="dd" ></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </TD>
  </TR>
</TABLE>
<table width="1004" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="23" height="27" background="../../images/top_6-1.jpg"><IMG SRC="../images/down_1.jpg" WIDTH=23 HEIGHT=23 ALT=""></td>
    <td width="981" bgcolor="#000000"><table width="981" height="23" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td><div align="center">
              <script language="JavaScript">
function dohome(){
this.home.style.behavior='url(#default#homepage)';this.home.setHomePage('http://www.yz-china.com/');}var focusok=false;

if (navigator.appName == "Netscape")
{focusok=true;}
vers=navigator.appVersion;

if (navigator.appName == "Microsoft Internet Explorer"){
 pos=vers.lastIndexOf('.'); 
 vers=vers.substring(pos-1,vers.length);}
proper_version=parseFloat(vers); 

if(proper_version>=5){
	focusok=true;}

function launchstock(){
if(focusok){
	stock.focus();}
 return true;}
</script>
              <a href="#" name="home" onclick="dohome();"><font color="#FFCC00">��Ϊ��ҳ</font></a><font color="#FFCC00"> 
              |</font> <A href="javascript:window.external.AddFavorite('http://www.yz-china.com/',%20'�����ڴ�װ����')" target=_self><font color="#FFCC00">�����ղ�</font></A><font color="#FFCC00"> 
              |</font> <a href="../lxwm/index.asp"><font color="#FFCC00">��ϵ����</font></a> 
              <font color="#FFCC00">|</font> <a href="../link/index.asp" class="down-h-g"><font color="#FFCC00">��������</font></a> 
            </div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="73" background="../images/down_1.jpg">&nbsp;</td>
    <td><div align="center"> 
        <p class="down">Copyright @ 2005 yz-china.com, YuanZhou Decoration.All 
          Rights Reserved<br>
          ��Ȩ���� �����ڴ��� ��������/��� QQ��5580751 װ����Ϣ����QQ��28834204<br>
          <strong>E-mail:</strong> yuanzhouqihuabu@163.com ��ѯ�绰��010-64200739<br>
          <a href="http://www.miibeian.gov.cn">��ICP��05021813��</a> </div></td>
  </tr>
</table>

<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
