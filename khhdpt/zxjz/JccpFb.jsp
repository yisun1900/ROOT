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
		
    <TD width="681" valign="top"><table width="100%" height="644" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26">&nbsp;</td>
        </tr>
        <tr> 
          <td height="28"> 
            <div align="left"><img src="../images/xxfb-1.jpg" width="429" height="72"></div>
          </td>
        </tr>
        <tr> 
          <td valign="top"> <br>
            <table width="100%" border="0" height="834">
              <tr> 
                <td width="91%" valign="top"> Ŀǰλ�ã�->�Ҽ�װ�޽�չ-->���ɲ�Ʒ���� 
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="right" >����</td>
                      <td width="31%" ><%=khxm%>��<%=lxfs%>�� </td>
                      <td width="19%" align="right" >��ͬ��</td>
                      <td width="31%" ><%=hth%></td>
                    </tr>
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="right">���ݵ�ַ</td>
                      <td colspan="3"><%=fwdz%></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#F2F4E8"> 
                      <td height="10" colspan="8" align="center"><img src='../tubiao/iconShipBlue_16x16.gif'>���ɼҾӲ���</td>
                    </tr>
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>������Ʒ</b></td>
                      <td width="15%"><b>��������</b></td>
                      <td width="10%"><b>��ĿרԱ</b></td>
                      <td width="12%"><b>פ�����</b></td>
                      <td width="15%"><b>չ���Ҿӹ���</b></td>
                      <td width="16%"><b>��ͬ���</b></td>
                      <td width="13%"><b>��������</b></td>
                    </tr>
                    <%
	String yddbh=null;
	String clztmc=null;
	String clgw=null;
	String ztjjgw=null;
	double htje=0;
	double zjxje=0;
	double allhtze=0;
	double allzjxje=0;

	String lrr=null;
	String lrsj=null;
	String bz=null;
	String mmcljs=null;
	String sccsj=null;
	String ccsm=null;
	String htqdr=null;
	String htrq=null;
	String htbz=null;
	String jhazsj=null;
	String kjxsj=null;
	String wjqk=null;

	String skqrsj=null;
	String skqrr=null;
	String gcjslrsj=null;
	String gcjslrr=null;
	String srksj=null;
	String rkr=null;
	String rksm=null;
	String kazsj=null;
	String azsjbz=null;
	String aztzsj=null;
	String aztzr=null;

	String azkssj=null;
	String azjssj=null;
	String ycsm=null;
	String wjsj=null;
	String wjlrr=null;
	String tdsj=null;
	String tdlrr=null;

	ls_sql=" select yddbh,clztmc,clgw,ztjjgw,xmzy,htje,zjhze-htje zjxje";
	ls_sql+=" ,lrr,lrsj,bz,mmcljs,sccsj,ccsm,htqdr,htrq,htbz,jhazsj,kjxsj,DECODE(wjqk,'1','���ͻ��Թ�','2','��������ڴ����') wjqk";
	ls_sql+=" ,skqrsj,skqrr,gcjslrsj,gcjslrr,srksj,rkr,rksm,kazsj,azsjbz,aztzsj,aztzr";
	ls_sql+=" ,azkssj,azjssj,ycsm,wjsj,wjlrr,tdsj,tdlrr";
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
		htje=rs.getDouble("htje");
		zjxje=rs.getDouble("zjxje");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		mmcljs=cf.fillNull(rs.getString("mmcljs"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccsm=cf.fillNull(rs.getString("ccsm"));
		htqdr=cf.fillNull(rs.getString("htqdr"));
		htrq=cf.fillNull(rs.getDate("htrq"));
		htbz=cf.fillNull(rs.getString("htbz"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		wjqk=cf.fillNull(rs.getString("wjqk"));

		skqrsj=cf.fillNull(rs.getDate("skqrsj"));
		skqrr=cf.fillNull(rs.getString("skqrr"));
		gcjslrsj=cf.fillNull(rs.getDate("gcjslrsj"));
		gcjslrr=cf.fillNull(rs.getString("gcjslrr"));
		srksj=cf.fillNull(rs.getDate("srksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));

		azkssj=cf.fillNull(rs.getDate("azkssj"));
		azjssj=cf.fillNull(rs.getDate("azjssj"));
		ycsm=cf.fillNull(rs.getString("ycsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdlrr=cf.fillNull(rs.getString("tdlrr"));

		allhtze+=htje;

		%> 
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td rowspan="16" width="19%"><b>�����ڴ�ľ��</b></td>
                      <td width="15%"><%=clztmc%></td>
                      <td width="10%"><%=xmzy%></td>
                      <td width="12%"><%=clgw%></td>
                      <td width="15%"><%=ztjjgw%></td>
                      <td width="16%"><%=htje%></td>
                      <td width="13%"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">Ԥ�������</td>
                      <td colspan="2">¼��ʱ�䣺<%=lrsj%></td>
                      <td width="15%">¼���ˣ�<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">ľ�ų���</td>
                      <td colspan="2">����ʱ�䣺<%=sccsj%></td>
                      <td width="15%">����ʦ��<%=mmcljs%></td>
                      <td colspan="2"><%=ccsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td rowspan="3" align="center" width="15%">ǩ����ͬ</td>
                      <td colspan="2">��ͬ���ڣ�<%=htrq%></td>
                      <td width="15%">ǩ���ˣ�<%=htqdr%></td>
                      <td colspan="2" rowspan="3"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��ͬ��װʱ�䣺<%=jhazsj%></td>
                      <td rowspan="2" align="center"><%=wjqk%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">�����ֹʱ�䣺<%=kjxsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">����ȷ��</td>
                      <td colspan="2">����ȷ��ʱ�䣺<%=skqrsj%></td>
                      <td width="15%">ȷ���ˣ�<%=skqrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td width="15%" align="center">��������</td>
                      <td colspan="2">����ʱ�䣺<%=gcjslrsj%></td>
                      <td width="15%">�����ˣ�<%=gcjslrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">ľ�����</td>
                      <td colspan="2">���ʱ�䣺<%=srksj%></td>
                      <td width="15%">����ˣ�<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td rowspan="2" align="center">ȷ����װʱ��</td>
                      <td colspan="2">Э�̰�װʱ�䣺<%=kazsj%></td>
                      <td width="15%">&nbsp;</td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��֪ͨʱ�䣺<%=aztzsj%></td>
                      <td width="15%">֪ͨ�ˣ�<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">ľ�Ű�װ</td>
                      <td colspan="2">��ʼ��װʱ�䣺<%=azkssj%></td>
                      <td width="15%">&nbsp;</td>
                      <td colspan="2" rowspan="2"><%=ycsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">��װ���ʱ�䣺<%=azjssj%></td>
                      <td width="15%">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td width="15%" align="center">ľ�����</td>
                      <td colspan="2">���ʱ�䣺<%=wjsj%></td>
                      <td width="15%">¼���ˣ�<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">ľ���˵�</td>
                      <td colspan="2">�˵�ʱ�䣺<%=tdsj%></td>
                      <td width="15%">¼���ˣ�<%=tdlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>������Ʒ</b></td>
                      <td width="15%"><b>��������</b></td>
                      <td width="10%"><b>��ĿרԱ</b></td>
                      <td width="12%"><b>פ�����</b></td>
                      <td width="15%"><b>չ���Ҿӹ���</b></td>
                      <td width="16%"><b>��ͬ���</b></td>
                      <td width="13%"><b>��������</b></td>
                    </tr>
                    <%
	String ddbh=null;
	double htze=0;
	String pdsj=null;
	String cgsjs=null;
	String pdsm=null;
	String jhccsj=null;
	String jhccxgr=null;
	String jhccxgyy=null;
	String ccr=null;
	String ccbz=null;

	String jhfcsj=null;
	String jhfcxgr=null;
	String jhfcxgyy=null;
	String sfcsj=null;
	String fcr=null;
	String fcbz=null;
	String qhtsj=null;
	String jhazrq=null;
//	String kjxsj=null;
	String qhtr=null;
//	String htbz=null;
	
	String htqrsj=null;
	String htqrr=null;
	String htqrbz=null;
	String gcjssj=null;
	String gcjsr=null;
	String gcjsbz=null;
	String rksj=null;
//	String rkr=null;
//	String rksm=null;

//	String kazsj=null;
	String kazsjlrr=null;
//	String azsjbz=null;
//	String aztzsj=null;
//	String aztzr=null;
	String ksazsj=null;
	String sazrq=null;
	String azr=null;
	String azsm=null;
//	String wjsj=null;
//	String wjlrr=null;
//	String tdsj=null;
	String tdblr=null;
	
	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,lrr,lrsj,htze,zjhze-htze zjxje,bz";
	ls_sql+=" ,pdsj,cgsjs,pdsm,jhccsj,jhccxgr,jhccxgyy,sccsj,ccr,ccbz";
	ls_sql+=" ,jhfcsj,jhfcxgr,jhfcxgyy,sfcsj,fcr,fcbz,qhtsj,jhazrq,kjxsj,qhtr,htbz";
	ls_sql+=" ,htqrsj,htqrr,htqrbz,gcjssj,gcjsr,gcjsbz,rksj,rkr,rksm";
	ls_sql+=" ,kazsj,kazsjlrr,azsjbz,aztzsj,aztzr,ksazsj,sazrq,azr,azsm,wjsj,wjlrr,tdsj,tdblr";
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
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");
		zjxje=rs.getDouble("zjxje");
		bz=cf.fillNull(rs.getString("bz"));

		pdsj=cf.fillNull(rs.getDate("pdsj"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccr=cf.fillNull(rs.getString("ccr"));
		ccbz=cf.fillNull(rs.getString("ccbz"));

		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		jhfcxgr=cf.fillNull(rs.getString("jhfcxgr"));
		jhfcxgyy=cf.fillNull(rs.getString("jhfcxgyy"));
		sfcsj=cf.fillNull(rs.getDate("sfcsj"));
		fcr=cf.fillNull(rs.getString("fcr"));
		fcbz=cf.fillNull(rs.getString("fcbz"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		htbz=cf.fillNull(rs.getString("htbz"));


		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));


		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azr=cf.fillNull(rs.getString("azr"));
		azsm=cf.fillNull(rs.getString("azsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=htze;

		%> 
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="19" width="19%" align="center"><b>�����ڴ����</b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=htze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">Ԥ�������</td>
                      <td colspan="2">¼��ʱ�䣺<%=lrsj%></td>
                      <td width="15%">¼���ˣ�<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�����ʦ</td>
                      <td colspan="2">�����ʦʱ�䣺<%=pdsj%></td>
                      <td width="15%">���ʦ��<%=cgsjs%></td>
                      <td colspan="2"><%=pdsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">ȷ������ʱ��</td>
                      <td colspan="2">�ƻ�����ʱ�䣺<%=jhccsj%></td>
                      <td width="15%">¼���ˣ�<%=jhccxgr%></td>
                      <td colspan="2"><%=jhccxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�������</td>
                      <td colspan="2">ʵ����ʱ�䣺<%=sccsj%></td>
                      <td width="15%">¼���ˣ�<%=ccr%></td>
                      <td colspan="2"><%=ccbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">ȷ������ʱ��</td>
                      <td colspan="2">�ƻ�����ʱ�䣺<%=jhfcsj%></td>
                      <td width="15%">¼���ˣ�<%=jhfcxgr%></td>
                      <td colspan="2"><%=jhfcxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">���񸴲�</td>
                      <td colspan="2">ʵ����ʱ�䣺<%=sfcsj%></td>
                      <td width="15%">¼���ˣ�<%=fcr%></td>
                      <td colspan="2"><%=fcbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">ǩ����ͬ</td>
                      <td colspan="2">ǩ��ͬʱ�䣺<%=qhtsj%></td>
                      <td width="15%">ǩ���ˣ�<%=qhtr%></td>
                      <td colspan="2" rowspan="2"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��ͬ��װ���ڣ�<%=jhazrq%></td>
                      <td width="15%">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">����ȷ��</td>
                      <td colspan="2">����ȷ��ʱ�䣺<%=htqrsj%></td>
                      <td width="15%">ȷ���ˣ�<%=htqrr%></td>
                      <td colspan="2"><%=htqrbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">��������</td>
                      <td colspan="2">��������ʱ�䣺<%=gcjssj%></td>
                      <td width="15%">�����ˣ�<%=gcjsr%></td>
                      <td colspan="2"><%=gcjsbz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�������</td>
                      <td colspan="2">���ʱ�䣺<%=rksj%></td>
                      <td width="15%">����ˣ�<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">ȷ����װʱ��</td>
                      <td colspan="2">Э�̰�װʱ�䣺<%=kazsj%></td>
                      <td width="15%">¼���ˣ�<%=kazsjlrr%></td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��֪ͨʱ�䣺<%=aztzsj%></td>
                      <td width="15%">֪ͨ�ˣ�<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" rowspan="2">����װ</td>
                      <td colspan="2">��ʼ��װʱ�䣺<%=ksazsj%></td>
                      <td rowspan="2">¼���ˣ�<%=azr%></td>
                      <td colspan="2" rowspan="2"><%=azsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">��װ���ʱ�䣺<%=sazrq%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">�������</td>
                      <td colspan="2">���ʱ�䣺<%=wjsj%></td>
                      <td width="15%">¼���ˣ�<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�����˵�</td>
                      <td colspan="2">�˵�ʱ�䣺<%=tdsj%></td>
                      <td width="15%">¼���ˣ�<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC" align="center"> 
                      <td width="19%"><b>������Ʒ</b></td>
                      <td width="15%"><b>��������</b></td>
                      <td width="10%"><b>��ĿרԱ</b></td>
                      <td width="12%"><b>פ�����</b></td>
                      <td width="15%"><b>չ���Ҿӹ���</b></td>
                      <td width="16%"><b>��ͬ���</b></td>
                      <td width="13%"><b>��������</b></td>
                    </tr>
                    <%
	String jjsjs=null;
	ls_sql=" select ddbh,clztmc,clgw,ztjjgw,xmzy,lrr,lrsj,htze,zjhze-htze zjxje,bz";
	ls_sql+=" ,pdsj,jjsjs,pdsm,jhccsj,jhccxgr,jhccxgyy,sccsj,ccr,ccbz";
	ls_sql+=" ,qhtsj,jhazrq,kjxsj,qhtr,htbz";
	ls_sql+=" ,htqrsj,htqrr,htqrbz,gcjssj,gcjsr,gcjsbz,rksj,rkr,rksm";
	ls_sql+=" ,kazsj,kazsjlrr,azsjbz,aztzsj,aztzr,ksazsj,sazrq,azr,azsm,wjsj,wjlrr,tdsj,tdblr";
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
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		htze=rs.getDouble("htze");
		zjxje=rs.getDouble("zjxje");
		bz=cf.fillNull(rs.getString("bz"));

		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgr=cf.fillNull(rs.getString("jhccxgr"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccr=cf.fillNull(rs.getString("ccr"));
		ccbz=cf.fillNull(rs.getString("ccbz"));

		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		qhtr=cf.fillNull(rs.getString("qhtr"));
		htbz=cf.fillNull(rs.getString("htbz"));


		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rksm=cf.fillNull(rs.getString("rksm"));


		kazsj=cf.fillNull(rs.getDate("kazsj"));
		kazsjlrr=cf.fillNull(rs.getString("kazsjlrr"));
		azsjbz=cf.fillNull(rs.getString("azsjbz"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azr=cf.fillNull(rs.getString("azr"));
		azsm=cf.fillNull(rs.getString("azsm"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=htze;

		%> 
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="17" width="19%" align="center"><b>�����ڴ�Ҿ�</b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=htze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="6">&nbsp; </td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">Ԥ�������</td>
                      <td colspan="2">¼��ʱ�䣺<%=lrsj%></td>
                      <td width="15%">¼���ˣ�<%=lrr%></td>
                      <td colspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�����ʦ</td>
                      <td colspan="2">�����ʦʱ�䣺<%=pdsj%></td>
                      <td width="15%">���ʦ��<%=jjsjs%></td>
                      <td colspan="2"><%=pdsm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">ȷ������ʱ��</td>
                      <td colspan="2">�ƻ�����ʱ�䣺<%=jhccsj%></td>
                      <td width="15%">¼���ˣ�<%=jhccxgr%></td>
                      <td colspan="2"><%=jhccxgyy%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�Ҿ߳���</td>
                      <td colspan="2">ʵ����ʱ�䣺<%=sccsj%></td>
                      <td width="15%">¼���ˣ�<%=ccr%></td>
                      <td colspan="2"><%=ccbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">ǩ����ͬ</td>
                      <td colspan="2">ǩ��ͬʱ�䣺<%=qhtsj%></td>
                      <td rowspan="2">ǩ���ˣ�<%=qhtr%></td>
                      <td colspan="2" rowspan="2"><%=htbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��ͬ��װ���ڣ�<%=jhazrq%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">����ȷ��</td>
                      <td colspan="2">����ȷ��ʱ�䣺<%=htqrsj%></td>
                      <td width="15%">ȷ���ˣ�<%=htqrr%></td>
                      <td colspan="2"><%=htqrbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">��������</td>
                      <td colspan="2">��������ʱ�䣺<%=gcjssj%></td>
                      <td width="15%">�����ˣ�<%=gcjsr%></td>
                      <td colspan="2"><%=gcjsbz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�Ҿ����</td>
                      <td colspan="2">���ʱ�䣺<%=rksj%></td>
                      <td width="15%">����ˣ�<%=rkr%></td>
                      <td colspan="2"><%=rksm%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" rowspan="2">ȷ����װʱ��</td>
                      <td colspan="2">Э�̰�װʱ�䣺<%=kazsj%></td>
                      <td width="15%">¼���ˣ�<%=kazsjlrr%></td>
                      <td colspan="2" rowspan="2"><%=azsjbz%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td colspan="2">��֪ͨʱ�䣺<%=aztzsj%></td>
                      <td width="15%">֪ͨ�ˣ�<%=aztzr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" rowspan="2">�Ҿ߰�װ</td>
                      <td colspan="2">��ʼ��װʱ�䣺<%=ksazsj%></td>
                      <td rowspan="2">¼���ˣ�<%=azr%></td>
                      <td colspan="2" rowspan="2"><%=azsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">��װ���ʱ�䣺<%=sazrq%></td>
                    </tr>
                    <tr bgcolor="#ECECEC"> 
                      <td align="center" width="15%">�Ҿ����</td>
                      <td colspan="2">���ʱ�䣺<%=wjsj%></td>
                      <td width="15%">¼���ˣ�<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td align="center" width="15%">�Ҿ��˵�</td>
                      <td colspan="2">�˵�ʱ�䣺<%=tdsj%></td>
                      <td width="15%">¼���ˣ�<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <%
	}
	rs.close();
	ps.close();
%> 
                  </table>
                  <%
	double hkze=0;
	String ppbm=null;
	String htshsj=null;
	String ddqrr=null;
	String ddqrsj=null;
	String gysjslrr=null;
	String gysjslrsj=null;

	String jhshsj=null;
	String tzshsj=null;
	String tzshr=null;
	String shtzsm=null;
	String sshsj=null;
	String sshr=null;
	String shqk=null;

	String jhtbhsj=null;
	String tztbhr=null;
	String stbhsj=null;
	String stbhr=null;
	String tbhqk=null;

	wjsj="";
	wjlrr="";
	tdsj="";
	tdblr="";
	
	ls_sql=" select ddbh,ppbm,clztmc,clgw,ztjjgw,xmzy,hkze,zjhze";
	ls_sql+=" ,qhtsj,htshsj,lrr,bz,ddqrr,ddqrsj,gysjslrr,gysjslrsj";
	ls_sql+=" ,jhshsj,tzshsj,tzshr,shtzsm,sshsj,sshr,shqk";
	ls_sql+=" ,jhtbhsj,tztbhr,stbhsj,stbhr,tbhqk";
	ls_sql+=" ,wjsj,wjlrr,tdsj,tdblr";
	ls_sql+=" from jc_zcdd,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.clzt>'05'";
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
		hkze=rs.getDouble("hkze");
		zjxje=rs.getDouble("zjhze");

		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		bz=cf.fillNull(rs.getString("bz"));
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		gysjslrr=cf.fillNull(rs.getString("gysjslrr"));
		gysjslrsj=cf.fillNull(rs.getDate("gysjslrsj"));

		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		sshsj=cf.fillNull(rs.getDate("sshsj"));
		sshr=cf.fillNull(rs.getString("sshr"));
		shqk=cf.fillNull(rs.getString("shqk"));


		jhtbhsj=cf.fillNull(rs.getDate("jhtbhsj"));
		tztbhr=cf.fillNull(rs.getString("tztbhr"));
		stbhsj=cf.fillNull(rs.getDate("stbhsj"));
		stbhr=cf.fillNull(rs.getString("stbhr"));
		tbhqk=cf.fillNull(rs.getString("tbhqk"));

		
		wjsj=cf.fillNull(rs.getDate("wjsj"));
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		tdblr=cf.fillNull(rs.getString("tdblr"));

		allhtze+=hkze;

		%> 
                  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                    <tr bgcolor="#CCCCCC"> 
                      <td width="19%" align="center"><b>������Ʒ</b></td>
                      <td width="15%" align="center"><b>��������</b></td>
                      <td width="10%" align="center"><b>��ĿרԱ</b></td>
                      <td width="12%" align="center"><b>פ�����</b></td>
                      <td width="15%" align="center"><b>չ���Ҿӹ���</b></td>
                      <td width="16%" align="center"><b>��ͬ���</b></td>
                      <td width="13%" align="center"><b>��������</b></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="13" align="center"><b><%=ppbm%></b></td>
                      <td width="15%" align="center"><%=clztmc%></td>
                      <td width="10%" align="center"><%=xmzy%></td>
                      <td width="12%" align="center"><%=clgw%></td>
                      <td width="15%" align="center"><%=ztjjgw%></td>
                      <td width="16%" align="center"><%=hkze%></td>
                      <td width="13%" align="center"><%=zjxje%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF" align="center"> 
                      <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">ǩ��ͬ</td>
                      <td colspan="2">ǩ��ͬʱ�䣺<%=qhtsj%></td>
                      <td rowspan="2">ǩ���ˣ�<%=lrr%></td>
                      <td colspan="2" rowspan="2"><%=bz%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">��ͬ�ͻ�ʱ�䣺<%=htshsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">����ȷ��</td>
                      <td colspan="2">����ȷ��ʱ�䣺<%=ddqrsj%></td>
                      <td width="15%">ȷ���ˣ�<%=ddqrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">��������</td>
                      <td colspan="2">����ʱ�䣺<%=gysjslrsj%></td>
                      <td width="15%">�����ˣ�<%=gysjslrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">ȷ���ͻ�ʱ��</td>
                      <td colspan="2">�ƻ��ͻ�ʱ�䣺<%=jhshsj%></td>
                      <td rowspan="2">¼���ˣ�<%=tzshr%></td>
                      <td colspan="2" rowspan="2"><%=shtzsm%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">���ͻ�֪ͨ��<%=tzshsj%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">�ͻ�</td>
                      <td colspan="2">ʵ�ͻ�ʱ�䣺<%=sshsj%></td>
                      <td width="15%">¼���ˣ�<%=sshr%></td>
                      <td colspan="2"><%=shqk%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td rowspan="2" align="center">�˲���</td>
                      <td colspan="2">Լ���˲�����<%=jhtbhsj%></td>
                      <td width="15%">¼���ˣ�<%=tztbhr%></td>
                      <td colspan="2" rowspan="2"><%=tbhqk%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td colspan="2">ʵ�˲���ʱ�䣺<%=stbhsj%></td>
                      <td width="15%">¼���ˣ�<%=stbhr%></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">�������</td>
                      <td colspan="2">���ʱ�䣺<%=wjsj%></td>
                      <td width="15%">¼���ˣ�<%=wjlrr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="15%" align="center">�˵�</td>
                      <td colspan="2">�˵�ʱ�䣺<%=tdsj%></td>
                      <td width="15%">¼���ˣ�<%=tdblr%></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                  </table>
                  <%
	}
	rs.close();
	ps.close();
%> </td>
              </tr>
              <tr> 
                <td width="87%" valign="top">&nbsp;</td>
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
