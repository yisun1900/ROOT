<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>



<LINK REL="stylesheet" HREF="../images/stype.css" TYPE="text/css">
<link href="../css/h-g.css" rel="stylesheet" type="text/css">
<body leftmargin="0" topmargin="0">

<%
String khbh=(String)session.getAttribute("khbh");

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

String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String ybysxmbm=null;
String sybgcrq=null;
String zqysxmbm=null;
String szqsj=null;

String tgbz=null;
String tgkssj=null;
String gjfgsj=null;
String tgyybm=null;
String tgsm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,lxfs,fwdz,hth,fgsbh,crm_khxx.dwbh,dwmc,sgd,sgbz,zjxm,sjs,xmzy,gcjdmc,cxhdbm";
	ls_sql+=" ,kgrq,jgrq,sjkgrq,sjjgrq,a.gcyszxmmc ybysxmbm,sybgcrq,b.gcyszxmmc zqysxmbm,szqsj";
	ls_sql+=" ,tgbz,tgkssj,gjfgsj,tgyybm,tgsm";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,sq_dwxx,dm_gcyszxmbm a,dm_gcyszxmbm b";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.ybysxmbm=a.gcyszxmbm(+) and crm_khxx.zqysxmbm=b.gcyszxmbm(+)  ";
	ls_sql+=" and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tgbz=cf.fillHtml(rs.getString("tgbz"));
		tgkssj=cf.fillHtml(rs.getDate("tgkssj"));
		gjfgsj=cf.fillHtml(rs.getDate("gjfgsj"));
		tgyybm=cf.fillHtml(rs.getString("tgyybm"));
		tgsm=cf.fillHtml(rs.getString("tgsm"));

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
	}
	rs.close();
	ps.close();


%>


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
          <td width="817" background="../images/top1_4-2.jpg" class="css"> <TABLE align=right border=0 width=639>
              <TBODY>
                <TR> 
                  <TD width=640> <DIV align=center class=css><a href="/khhdpt/khxx/HhxxIndex.jsp">�ҵ�����</a> 
                      | <a href="/khhdpt/zytx/ZytxIndex.jsp">��Ҫ����</a> | <a href="/khhdpt/klzx/KlzxIndex.jsp">����װ��</a> 
                      | <a href="/khhdpt/zxjz/ZxjzIndex.jsp">�Ҽ�װ�޽�չ</a> | <a href="/khhdpt/gmjccp/khhdpt.html">���򼯳ɲ�Ʒ</a> 
                      | <a href="/khhdpt/yhys/khhdpt.html">�л�Ҫ˵ </a> | <a href="/khhdpt/wgpj/WgpjIndex.jsp">�깤����</a> | <a href="/khhdpt/yjdc/YjdcIndex.jsp">�ͻ�����</a> 
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
		
    <TD COLSPAN=4> <table width="1004" height="27" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="16"><img src="../images/index_1-1.jpg" width="23" height="27"></td>
          <td width="652"><table width="817" height="27" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td bgcolor="#DFDFDF">&nbsp;</td>
              </tr>
            </table></td>
          <td width="336" bgcolor="#9A9A9A">&nbsp;</td>
        </tr>
      </table></TD>
	</TR>
	<TR>
		
    <TD width="23" height="863" background="../images/index_1-1-1.jpg"> <img src="../images/index_1-1-1.jpg" width="23" height="1"></TD>
		
    <TD width="282" valign="top" background="../images/index_3-2.jpg"> 
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
                          <div align="center">
                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="258" height="172">
                              <param name="movie" value="../images/x-1.swf">
                              <param name="quality" value="high">
                              <embed src="../images/x-1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="258" height="172"></embed></object>
                          </div></td>
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
                              <td width="219"><a href="ZxjzIndex.jsp">������Ϣ����</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="JccpFb.jsp">���ɲ�Ʒ</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="GcysFb.jsp">�����������</a></td>
                            </tr>
                            <tr> 
                              <td height="26"><div align="right"><img src="../images/x-4.jpg" width="10" height="12"></div></td>
                              <td height="30">&nbsp;</td>
                              <td height="30"><a href="GchfFb.jsp">���̻ط����</a></td>
                            </tr>
                            <tr> 
                              <td height="26">&nbsp;</td>
                              <td height="30">&nbsp;</td>
                              <td height="30">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                  </div>
                  <div align="left"></div></td>
              </tr>
            </table> </td>
        </tr>
      </table>
      <div align="center"> </div></TD>
		
    <TD width="677" valign="top"><table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> <div align="left"><img src="../images/xxfb.jpg" width="429" height="72"></div></td>
        </tr>
        <tr> 
          <td valign="top"> <br>
            <table width="100%" border="0" height="834">
              <tr> 
                <td width="87%" valign="top"> Ŀǰλ�ã�->�Ҽ�װ�޽�չ--&gt;������Ϣ���� 
                  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
                    <tr> 
                      <td width="19%" height="24" align="right" bgcolor="#E4E4E4" >����</td>
                      <td width="31%" ><%=khxm%>��<%=lxfs%>�� </td>
                      <td width="19%" align="right" bgcolor="#E4E4E4" >��ͬ��</td>
                      <td width="31%" ><%=hth%></td>
                    </tr>
                    <tr> 
                      <td width="19%" height="24" align="right" bgcolor="#E4E4E4">���ݵ�ַ</td>
                      <td colspan="3"><%=fwdz%></td>
                    </tr>
                  </table>
                  <form method="post" action="" name="gcform" target='_blank'>
                    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
                      <tr bgcolor="#F6F6F6" align="center" valign="middle">
                        <td height="24" colspan="4" ><img src='../tubiao/iconChance_16x16.gif'>���̲���</td>
                      </tr>
                      <tr bgcolor="#F6F6F6" align="center" valign="middle"> 
                        <td height="24" colspan="4" >
						<font color="#FF0000"><b><marquee onMouseOver='this.stop()' onMouseOut='this.start()' scrolldelay=100 >
						�𾴵Ŀͻ��������ල���ҵĹ��̽��ȡ��������ա����̻ط����������������������ϵ 
                          </marquee> </b></font></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" valign="middle" bgcolor="#E4E4E4">װ�޽�չ<img src='../tubiao/iconWatchB_16x16.gif'></td>
                        <td width="31%" height="24"><%=gcjdmc%></td>
                        <td height="24" colspan="2"> <%
		if (tgbz.equals("Y"))//W��������Y����ͣ����N������
		{
			out.println("<img src='../tubiao/iconClose_20x20.gif'>�ܱ�Ǹ��ʱͣ��");
		}
		  %> </td>
                      </tr>
                      <%
	if (tgbz.equals("Y"))
	{
		%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">ͣ����ʼʱ��</td>
                        <td width="31%" height="24"><%=tgkssj%></td>
                        <td width="19%" height="24" align="right">���Ƹ�������</td>
                        <td width="31%" height="24"><%=gjfgsj%></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">ͣ��˵��</td>
                        <td height="24" colspan="3"><%=tgsm%></td>
                      </tr>
                      <%
	}
%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">��ͬ��������</td>
                        <td width="31%" height="24"><%=kgrq%></td>
                        <td width="19%" height="24" align="right">��ͬ�깤����</td>
                        <td width="31%" height="24"><%=jgrq%></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">ʵ�ʿ�������</td>
                        <td width="31%" height="24"><%=sjkgrq%></td>
                        <td width="19%" height="24" align="right">ʵ�ʿ�������</td>
                        <td width="31%" height="24"><%=sjjgrq%></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">���ι�����������</td>
                        <td width="31%" height="24"><%=sybgcrq%></td>
                        <td width="19%" height="24" align="right">���ι���������Ŀ</td>
                        <td width="31%" height="24"><%=ybysxmbm%></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">��������ʱ��</td>
                        <td width="31%" height="24"><%=szqsj%></td>
                        <td width="19%" height="24" align="right">����������Ŀ</td>
                        <td width="31%" height="24"><%=zqysxmbm%></td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">�������ռ�¼</td>
                        <td height="24" colspan="3"> <%		  
	
	String gcyszxmmc="";

	int row=0;
	ls_sql=" select gcyszxmmc";
	ls_sql+=" from crm_gcyszxmjl,dm_gcyszxmbm";
	ls_sql+=" where crm_gcyszxmjl.gcyszxmbm=dm_gcyszxmbm.gcyszxmbm(+)";
	ls_sql+=" and crm_gcyszxmjl.khbh='"+khbh+"' ";
	ls_sql+=" order by  crm_gcyszxmjl.yssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gcyszxmmc=cf.fillNull(rs.getString("gcyszxmmc"));
		row++;

		if (row>1)
		{
			%> <img src='../tubiao/iconFdbkBlu_16x16.gif'> <img src='../tubiao/iconFdbkBlu_16x16.gif'> 
                          <a href='/khhdpt/zxjz/GcysFb.jsp'><b><%=gcyszxmmc%></b></a> 
                          <%
		}
		else{
			%> <a href='/khhdpt/zxjz/GcysFb.jsp'><b><%=gcyszxmmc%></b></a> <%
		}


	}
	rs.close();
	ps.close();
%> </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="right" bgcolor="#E4E4E4">���̻طü�¼</td>
                        <td height="24" colspan="3"> <%		  
	String hfjlh="";
	String hflxmc="";
	String hfsj="";
	String jglxmc="";

	row=0;

	ls_sql=" select hfjlh,hflxmc,hfsj,jglxmc ";
	ls_sql+=" from crm_hfjl,dm_hflxbm,dm_jglxbm";
	ls_sql+=" where crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
	ls_sql+=" and crm_hfjl.khbh='"+khbh+"' ";
	ls_sql+=" order by  hfjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		hflxmc=cf.fillNull(rs.getString("hflxmc"));
		hfsj=cf.fillNull(rs.getString("hfsj"));
		jglxmc=cf.fillNull(rs.getString("jglxmc"));

		row++;

		if (row>1)
		{
			%> <img src='../tubiao/iconFdbkBlu_16x16.gif'> <img src='../tubiao/iconFdbkBlu_16x16.gif'> 
                          <a href='/khhdpt/zxjz/GchfFb.jsp'><b><%=hflxmc%></b></a> 
                          <%
		}
		else{
			%> <a href='/khhdpt/zxjz/GchfFb.jsp'><b><%=hflxmc%></b></a> <%
		}
	}
	rs.close();
	ps.close();
%> </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" align="right" bgcolor="#E4E4E4"><font color="#FF0000">*</font>�Ƿ�Ҫ��ظ�</td>
                        <td colspan="3" bgcolor="#E4E4E4"> 
                          <input type="radio" name="sfyqhf" value="1">
                          ����ظ� 
                          <input type="radio" name="sfyqhf" value="2">
                          ����ظ� 
                          <input type="radio" name="sfyqhf" value="3">
                          ��Ҫ��</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" align="right" bgcolor="#E4E4E4"><font color="#FF0000">*</font>�� 
                          �� �� ��&nbsp;<br>
                          <br>
                          <input type="hidden" name="khbh" value="<%=khbh%>" >
                          <input type="button" onClick="f_gcly(gcform)" value="�ύ����" name="gcly">
                        </td>
                        <td colspan="3" bgcolor="#E4E4E4"> 
                          <textarea name="lynr" rows="5" cols="75"></textarea>
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td colspan="4"> <%
	String lysj=null;
	String lynr=null;
	String sfyqhf=null;
	String lysfyck=null;
	String lyckr=null;
	String lycksj=null;
	String lyhfnr=null;

	row =0;
	ls_sql="select lysj,lynr,sfyqhf,lysfyck,lyckr,lycksj,lyhfnr";
	ls_sql+=" from  hd_khly";
	ls_sql+=" where khbh='"+khbh+"' and lylx='1' ";//1���������ԣ�2���������ԣ�9����������
	ls_sql+=" order by lyxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		row++;
		lysj=cf.fillNull(rs1.getDate("lysj"));
		lynr=cf.fillNull(rs1.getString("lynr"));
		sfyqhf=cf.fillNull(rs1.getString("sfyqhf"));
		lysfyck=cf.fillNull(rs1.getString("lysfyck"));
		lyckr=cf.fillNull(rs1.getString("lyckr"));
		lycksj=cf.fillNull(rs1.getDate("lycksj"));
		lyhfnr=cf.fillNull(rs1.getString("lyhfnr"));

		if (sfyqhf.equals("1"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="������ظ���";
		}
		else if (sfyqhf.equals("2"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="������ظ���";
		}
		else if (sfyqhf.equals("3"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="";
		}

		%> 
                          <table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 14px;width:100.0%;background:#F6F6F6'>
                            <tr bgcolor="#FFFFFF"> 
                              <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="19%"> 
                                <%=row%>��<%=lysj%>����<%=sfyqhf%>��<%=lynr%> </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
                                <%
			if (lysfyck.equals("Y"))//N��δ�鿴��Y���Ѳ鿴
			{
				if (lyhfnr.equals(""))//���Իظ�����
				{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" �� "+lycksj+" �鿴");
				}
				else{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" �� "+lycksj+" �ظ���"+lyhfnr);
				}
			}
			else{
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconMailBlue_16x16.gif'>Ͷ��δ�鿴");
			}
			%> </td>
                            </tr>
                          </table>
                          <%
	}
	rs1.close();
	ps1.close();

%> </td>
                      </tr>
                    </table>
                  </form>
                  <form method="post" action="" name="jcform" target='_blank'>
                    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
                      <tr bgcolor="#F5F5F5"> 
                        <td height="24" colspan="8" align="center"><img src='../tubiao/iconShipBlue_16x16.gif'>���ɼҾӲ���</td>
                      </tr>
                      <tr bgcolor="#F5F5F5"> 
                        <td height="24" colspan="8" align="center">
						<font color="#FF0000"><b>
						<marquee onMouseOver='this.stop()' onMouseOut='this.start()' scrolldelay=100 >
						�𾴵Ŀͻ���������ϸ��ʵ���������Ƿ���ʵ����������������Ƿ�����������������������ϵ
						</marquee>
						</b></font></td>
                      </tr>
                      <tr bgcolor="#E4E4E4"> 
                        <td width="19%" height="24" align="center"><b>������Ʒ</b></td>
                        <td width="16%" height="24" align="center"><b>��������</b></td>
                        <td width="12%" height="24" align="center"><b>��ĿרԱ</b></td>
                        <td width="14%" height="24" align="center"><b>פ��Ҿӹ���</b></td>
                        <td width="13%" height="24" align="center"><b>չ���Ҿӹ���</b></td>
                        <td width="12%" height="24" align="center"><b>��ͬ���</b></td>
                        <td width="14%" height="24" align="center"><b>¼��ʱ��</b></td>
                      </tr>
                      <%
	String yddbh=null;
	String clztmc=null;
	String clgw=null;
	String ztjjgw=null;
	String lrsj=null;
	double htje=0;
	double allhtze=0;

	ls_sql=" select yddbh,clztmc,clgw,ztjjgw,xmzy,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,htje";
	ls_sql+=" from jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt";
	ls_sql+=" and jc_mmydd.khbh='"+khbh+"' ";
	ls_sql+=" order by  yddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htje=rs.getDouble("htje");

		allhtze+=htje;

		%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="center" bgcolor="#E4E4E4"><b>�����ڴ�ľ��</b></td>
                        <td width="16%" height="24" align="center"><%=clztmc%></td>
                        <td width="12%" height="24" align="center"><%=xmzy%></td>
                        <td width="14%" height="24" align="center"><%=clgw%></td>
                        <td width="13%" height="24" align="center"><%=ztjjgw%></td>
                        <td width="12%" height="24" align="center"><%=htje%></td>
                        <td width="14%" height="24" align="center"><%=lrsj%></td>
                      </tr>
                      <%
	}
	rs.close();
	ps.close();
%> <%
	String ddbh=null;
	double htze=0;

	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,htze";
	ls_sql+=" from jc_cgdd,jdm_cgddzt";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt";
	ls_sql+=" and jc_cgdd.khbh='"+khbh+"' ";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");

		allhtze+=htze;

		%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="center" bgcolor="#E4E4E4"><b>�����ڴ����</b></td>
                        <td width="16%" height="24" align="center"><%=clztmc%></td>
                        <td width="12%" height="24" align="center"><%=xmzy%></td>
                        <td width="14%" height="24" align="center"><%=clgw%></td>
                        <td width="13%" height="24" align="center"><%=ztjjgw%></td>
                        <td width="12%" height="24" align="center"><%=htze%></td>
                        <td width="14%" height="24" align="center"><%=lrsj%></td>
                      </tr>
                      <%
	}
	rs.close();
	ps.close();
%> <%
	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,htze";
	ls_sql+=" from jc_jjdd,jdm_jjddzt";
	ls_sql+=" where jc_jjdd.clzt=jdm_jjddzt.clzt";
	ls_sql+=" and jc_jjdd.khbh='"+khbh+"' ";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");

		allhtze+=htze;

		%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="center" bgcolor="#E4E4E4"><b>�����ڴ�Ҿ�</b></td>
                        <td width="16%" height="24" align="center"><%=clztmc%></td>
                        <td width="12%" height="24" align="center"><%=xmzy%></td>
                        <td width="14%" height="24" align="center"><%=clgw%></td>
                        <td width="13%" height="24" align="center"><%=ztjjgw%></td>
                        <td width="12%" height="24" align="center"><%=htze%></td>
                        <td width="14%" height="24" align="center"><%=lrsj%></td>
                      </tr>
                      <%
	}
	rs.close();
	ps.close();
%> <%
	double hkze=0;
	String ppbm=null;

	ls_sql=" select ddbh,ppbm,clztmc,clgw,ztjjgw,xmzy,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,hkze";
	ls_sql+=" from jc_zcdd,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"' ";
	ls_sql+=" order by  ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		clztmc=cf.fillNull(rs.getString("clztmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		hkze=rs.getDouble("hkze");

		allhtze+=hkze;

		%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="center" bgcolor="#E4E4E4"><b><%=ppbm%></b></td>
                        <td width="16%" height="24" align="center"><%=clztmc%></td>
                        <td width="12%" height="24" align="center"><%=xmzy%></td>
                        <td width="14%" height="24" align="center"><%=clgw%></td>
                        <td width="13%" height="24" align="center"><%=ztjjgw%></td>
                        <td width="12%" height="24" align="center"><%=hkze%></td>
                        <td width="14%" height="24" align="center"><%=lrsj%></td>
                      </tr>
                      <%
	}
	rs.close();
	ps.close();
%> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" height="24" align="center" bgcolor="#E4E4E4"><b>�ϼ�</b></td>
                        <td width="16%" height="24" align="center">&nbsp;</td>
                        <td width="12%" height="24" align="center">&nbsp;</td>
                        <td width="14%" height="24" align="center">&nbsp;</td>
                        <td width="13%" height="24" align="center">&nbsp;</td>
                        <td width="12%" height="24" align="center"><%=allhtze%></td>
                        <td width="14%" height="24" align="center">&nbsp;</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" align="right" bgcolor="#E4E4E4"><font color="#FF0000">*</font>�Ƿ�Ҫ��ظ�</td>
                        <td colspan="6" bgcolor="#E4E4E4"> 
                          <input type="radio" name="sfyqhf" value="1">
                          ����ظ� 
                          <input type="radio" name="sfyqhf" value="2">
                          ����ظ� 
                          <input type="radio" name="sfyqhf" value="3">
                          ��Ҫ��</td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td width="19%" align="right" bgcolor="#E4E4E4"> <font color="#FF0000">*</font>�� 
                          �� �� ��&nbsp;<br>
                          <br>
                          <input type="hidden" name="khbh" value="<%=khbh%>" >
                          <input type="button" value="�ύ����" onClick="f_jjly(jcform)" name="jcly">
                        </td>
                        <td colspan="6" bgcolor="#E4E4E4"> 
                          <textarea name="lynr" rows="5" cols="75"></textarea>
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td colspan="7"> <%

	row =0;
	ls_sql="select lysj,lynr,sfyqhf,lysfyck,lyckr,lycksj,lyhfnr";
	ls_sql+=" from  hd_khly";
	ls_sql+=" where khbh='"+khbh+"' and lylx='2' ";//1���������ԣ�2���������ԣ�9����������
	ls_sql+=" order by lyxh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		row++;
		lysj=cf.fillNull(rs1.getDate("lysj"));
		lynr=cf.fillNull(rs1.getString("lynr"));
		sfyqhf=cf.fillNull(rs1.getString("sfyqhf"));
		lysfyck=cf.fillNull(rs1.getString("lysfyck"));
		lyckr=cf.fillNull(rs1.getString("lyckr"));
		lycksj=cf.fillNull(rs1.getDate("lycksj"));
		lyhfnr=cf.fillNull(rs1.getString("lyhfnr"));

		if (sfyqhf.equals("1"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="������ظ���";
		}
		else if (sfyqhf.equals("2"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="������ظ���";
		}
		else if (sfyqhf.equals("3"))//1������ظ���2������ظ���3����Ҫ��
		{
			sfyqhf="";
		}

		%> 
                          <table  border=0 cellspacing=0 cellpadding=0 width="100%" style='FONT-SIZE: 14px;width:100.0%;background:#F6F6F6'>
                            <tr bgcolor="#FFFFFF"> 
                              <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#DBDBDB;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="19%"> 
                                <%=row%>��<%=lysj%>����<%=sfyqhf%>��<%=lynr%> </td>
                            </tr>
                            <tr bgcolor="#FFFFFF"> 
                              <td style='border-top:white;border-left:white;border-bottom:#C1C1C1;border-right:#C1C1C1;border-style:solid;border-width:1.0pt;background:#ECECEC;padding:3.75pt 2.25pt 2.25pt 3.75pt' height="32" width="81%"> 
                                <%
			if (lysfyck.equals("Y"))//N��δ�鿴��Y���Ѳ鿴
			{
				if (lyhfnr.equals(""))//���Իظ�����
				{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" �� "+lycksj+" �鿴");
				}
				else{
					out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconOpenedMail.gif'>"+lyckr+" �� "+lycksj+" �ظ���"+lyhfnr);
				}
			}
			else{
				out.println("&nbsp;&nbsp;&nbsp;&nbsp;<img src='../tubiao/iconMailBlue_16x16.gif'>Ͷ��δ�鿴");
			}
			%> </td>
                            </tr>
                          </table>
                          <%
	}
	rs1.close();
	ps1.close();

%> </td>
                      </tr>
                    </table>
                  </form>
                </td>
              </tr>
              <tr> 
                <td width="82%" valign="top">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table> </TD>
		
    <TD width="19" bgcolor="#E4E4E4"> 
      <table width="1" height="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="10" height="859" bgcolor="#E4E4E4">&nbsp;</td>
        </tr>
      </table> 
      
      <img src="../images/index_5-1.jpg" width="19" height="4"></TD>
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_gcly(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfyqhf)) {
		alert("��ѡ��[�Ƿ�Ҫ��ظ�]��");
		FormName.sfyqhf[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="������д�������ԣ���Ҫ����300������") {
		alert("������д���ԣ�");
		FormName.lynr.value="������д�������ԣ���Ҫ����300������";
		FormName.lynr.select();
		return false;
	}

	FormName.action="SaveKhly.jsp?lylx=1";//1���������ԣ�2���������ԣ�9���������ԣ�
	FormName.submit();
	FormName.gcly.disabled=true;
	return true;
}

function f_jjly(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfyqhf)) {
		alert("��ѡ��[�Ƿ�Ҫ��ظ�]��");
		FormName.sfyqhf[0].focus();
		return false;
	}

	if(	javaTrim(FormName.lynr)=="" || FormName.lynr.value=="������д���ɼҾ����ԣ���Ҫ����300������") {
		alert("������д���ԣ�");
		FormName.lynr.value="������д���ɼҾ����ԣ���Ҫ����300������";
		FormName.lynr.select();
		return false;
	}

	FormName.action="SaveKhly.jsp?lylx=2";
	FormName.submit();
	FormName.jcly.disabled=true;
	return true;
}

//-->
</SCRIPT>
