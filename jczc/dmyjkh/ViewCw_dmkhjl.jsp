<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String dwmc=null;
String dwdz=null;
String dwfzr=null;
String kdsj=null;
String ssfwmc=null;
String dwjbmc=null;
String dmxsmc=null;
String dwdh=null;


String khcz=null;
String mbcz=null;
String wccz=null;
String qdgs=null;
String yczdcl=null;
String mbczdcl=null;
String pjde=null;
String sqdj=null;
String ljdj=null;
String wjdjqds=null;
String scbcz=null;
String zdmczbl=null;
String scbgds=null;
String scbcds=null;
String scbcdbl=null;
String scbpjde=null;
String kllzs=null;
String scbkllb=null;
String scbqdsb=null;
String dmzrs=null;
String bzrysl=null;
String xzsl=null;
String sjrysl=null;
String sjsrjcz=null;
String wcdbrs=null;
String sjsdcl=null;
String lczrs=null;
String lczrrbl=null;
String zrsjscz=null;
String zrscbcz=null;
String zrsjsdj=null;
String zrsjsrs=null;
String zrsjsqds=null;
String zdmczb=null;
String zscbczb=null;
String zdmdjb=null;
String zzrsb=null;
String zzqdsb=null;
String zrsjspjde=null;
String zrsjssjf=null;
String zrsjsmj=null;
String zsjfzsrb=null;
String zrsjspmsjf=null;
String zrrjcz=null;
String sjfsr=null;
String sqsjfds=null;
String sqsjfmj=null;
String pjmhsjf=null;
String sjfzqdsb=null;
String pjpmsjf=null;
String spxse=null;
String zycpxse=null;
String wckhrysl=null;
String wczcz=null;
String wczmj=null;
String ytb=null;
String yhb=null;
String pfmhtzj=null;
String cyczyg=null;
String cydjyg=null;
String scbcyczyg=null;
String byczsm=null;
String cyczsm=null;
String fzyj=null;
String lrr=null;
String lrsj=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc,dwdz,dwfzr,kdsj,ssfwmc,dwjbmc,dmxsmc,dwdh";
	ls_sql+=" FROM sq_dwxx,dm_ssfw,dm_dwjb,dm_dmxs  ";
	ls_sql+=" where sq_dwxx.dwbh='"+dwbh+"'";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		dwdz=cf.fillHtml(rs.getString("dwdz"));
		dwfzr=cf.fillHtml(rs.getString("dwfzr"));
		kdsj=cf.fillHtml(rs.getDate("kdsj"));
		ssfwmc=cf.fillHtml(rs.getString("ssfwmc"));
		dwjbmc=cf.fillHtml(rs.getString("dwjbmc"));
		dmxsmc=cf.fillHtml(rs.getString("dmxsmc"));
		dwdh=cf.fillHtml(rs.getString("dwdh"));
	}
	rs.close();
	ps.close();


	ls_sql="select khcz,mbcz,wccz,qdgs,yczdcl,mbczdcl,pjde,sqdj,ljdj,wjdjqds,scbcz,zdmczbl,scbgds,scbcds,scbcdbl,scbpjde,kllzs,scbkllb,scbqdsb,dmzrs,bzrysl,xzsl,sjrysl,sjsrjcz,wcdbrs,sjsdcl,lczrs,lczrrbl,zrsjscz,zrscbcz,zrsjsdj,zrsjsrs,zrsjsqds,zdmczb,zscbczb,zdmdjb,zzrsb,zzqdsb,zrsjspjde,zrsjssjf,zrsjsmj,zsjfzsrb,zrsjspmsjf,zrrjcz,sjfsr,sqsjfds,sqsjfmj,pjmhsjf,sjfzqdsb,pjpmsjf,spxse,zycpxse,wckhrysl,wczcz,wczmj,ytb,yhb,pfmhtzj,cyczyg,cydjyg,scbcyczyg,byczsm,cyczsm,fzyj,lrr,lrsj ";
	ls_sql+=" from  cw_dmkhjl";
	ls_sql+=" where dwbh='"+dwbh+"' and nian='"+nian+"' and yue='"+yue+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khcz=cf.fillNull(rs.getString("khcz"));
		mbcz=cf.fillNull(rs.getString("mbcz"));
		wccz=cf.fillNull(rs.getString("wccz"));
		qdgs=cf.fillNull(rs.getString("qdgs"));
		yczdcl=cf.fillNull(rs.getString("yczdcl"));
		mbczdcl=cf.fillNull(rs.getString("mbczdcl"));
		pjde=cf.fillNull(rs.getString("pjde"));
		sqdj=cf.fillNull(rs.getString("sqdj"));
		ljdj=cf.fillNull(rs.getString("ljdj"));
		wjdjqds=cf.fillNull(rs.getString("wjdjqds"));
		scbcz=cf.fillNull(rs.getString("scbcz"));
		zdmczbl=cf.fillNull(rs.getString("zdmczbl"));
		scbgds=cf.fillNull(rs.getString("scbgds"));
		scbcds=cf.fillNull(rs.getString("scbcds"));
		scbcdbl=cf.fillNull(rs.getString("scbcdbl"));
		scbpjde=cf.fillNull(rs.getString("scbpjde"));
		kllzs=cf.fillNull(rs.getString("kllzs"));
		scbkllb=cf.fillNull(rs.getString("scbkllb"));
		scbqdsb=cf.fillNull(rs.getString("scbqdsb"));
		dmzrs=cf.fillNull(rs.getString("dmzrs"));
		bzrysl=cf.fillNull(rs.getString("bzrysl"));
		xzsl=cf.fillNull(rs.getString("xzsl"));
		sjrysl=cf.fillNull(rs.getString("sjrysl"));
		sjsrjcz=cf.fillNull(rs.getString("sjsrjcz"));
		wcdbrs=cf.fillNull(rs.getString("wcdbrs"));
		sjsdcl=cf.fillNull(rs.getString("sjsdcl"));
		lczrs=cf.fillNull(rs.getString("lczrs"));
		lczrrbl=cf.fillNull(rs.getString("lczrrbl"));
		zrsjscz=cf.fillNull(rs.getString("zrsjscz"));
		zrscbcz=cf.fillNull(rs.getString("zrscbcz"));
		zrsjsdj=cf.fillNull(rs.getString("zrsjsdj"));
		zrsjsrs=cf.fillNull(rs.getString("zrsjsrs"));
		zrsjsqds=cf.fillNull(rs.getString("zrsjsqds"));
		zdmczb=cf.fillNull(rs.getString("zdmczb"));
		zscbczb=cf.fillNull(rs.getString("zscbczb"));
		zdmdjb=cf.fillNull(rs.getString("zdmdjb"));
		zzrsb=cf.fillNull(rs.getString("zzrsb"));
		zzqdsb=cf.fillNull(rs.getString("zzqdsb"));
		zrsjspjde=cf.fillNull(rs.getString("zrsjspjde"));
		zrsjssjf=cf.fillNull(rs.getString("zrsjssjf"));
		zrsjsmj=cf.fillNull(rs.getString("zrsjsmj"));
		zsjfzsrb=cf.fillNull(rs.getString("zsjfzsrb"));
		zrsjspmsjf=cf.fillNull(rs.getString("zrsjspmsjf"));
		zrrjcz=cf.fillNull(rs.getString("zrrjcz"));
		sjfsr=cf.fillNull(rs.getString("sjfsr"));
		sqsjfds=cf.fillNull(rs.getString("sqsjfds"));
		sqsjfmj=cf.fillNull(rs.getString("sqsjfmj"));
		pjmhsjf=cf.fillNull(rs.getString("pjmhsjf"));
		sjfzqdsb=cf.fillNull(rs.getString("sjfzqdsb"));
		pjpmsjf=cf.fillNull(rs.getString("pjpmsjf"));
		spxse=cf.fillNull(rs.getString("spxse"));
		zycpxse=cf.fillNull(rs.getString("zycpxse"));
		wckhrysl=cf.fillNull(rs.getString("wckhrysl"));
		wczcz=cf.fillNull(rs.getString("wczcz"));
		wczmj=cf.fillNull(rs.getString("wczmj"));
		ytb=cf.fillNull(rs.getString("ytb"));
		yhb=cf.fillNull(rs.getString("yhb"));
		pfmhtzj=cf.fillNull(rs.getString("pfmhtzj"));
		cyczyg=cf.fillNull(rs.getString("cyczyg"));
		cydjyg=cf.fillNull(rs.getString("cydjyg"));
		scbcyczyg=cf.fillNull(rs.getString("scbcyczyg"));
		byczsm=cf.fillNull(rs.getString("byczsm"));
		cyczsm=cf.fillNull(rs.getString("cyczsm"));
		fzyj=cf.fillNull(rs.getString("fzyj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="SaveEditCw_dmkhjl.jsp" name="insertform" >


<CENTER >
  <B>��������Ӫͳ��</B><BR>
    <b>(ͳ��ʱ�䣺<%=nian%>��<%=yue%>��)</b>
    <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
      <tr  align="center"> 
        <td colspan="6" bgcolor="#CCCCCC">�������</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>��������</b></td>
        <td width="17%"><%=dwmc%></td>
        <td width="16%" align="right"><b>�����ַ</b></td>
        <td colspan="3"><%=dwdz%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>���漶��</b></td>
        <td width="17%"><%=dwjbmc%></td>
        <td width="16%" align="right"><b>���渺����</b></td>
        <td width="17%"><%=dwfzr%></td>
        <td width="17%" align="right"><b>����绰</b></td>
        <td width="16%"><%=dwdh%></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><b>������ʽ</b></td>
        <td width="17%"><%=dmxsmc%></td>
        <td width="16%" align="right"><b>����ʱ��</b></td>
        <td width="17%"><%=kdsj%></td>
        <td width="17%" align="right"><b>������λ</b></td>
        <td width="16%"><%=ssfwmc%></td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���ݷ���ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">���¿��˲�ֵ</td>
        <td width="17%"><%=khcz%></td>
        <td width="16%" align="right">�г�����ֵ</td>
        <td width="17%"> <%=scbcz%> </td>
        <td width="17%" align="right">����������</td>
        <td width="16%"> <%=dmzrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">����Ŀ���ֵ</td>
        <td width="17%"><%=mbcz%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�����ֵ����</font></td>
        <td width="17%"> <%=zdmczbl%> </td>
        <td width="17%" align="right">��׼��Ա����</td>
        <td width="16%"> <%=bzrysl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">������ɲ�ֵ</td>
        <td width="17%"> <%=wccz%> </td>
        <td width="16%" align="right">�г�����������</td>
        <td width="17%"> <%=scbgds%> </td>
        <td width="17%" align="right">С������</td>
        <td width="16%"> <%=xzsl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">�²�ֵ�����</font></td>
        <td width="17%"> <%=yczdcl%> </td>
        <td width="16%" align="right">�ɵ�����</td>
        <td width="17%"> <%=scbcds%> </td>
        <td width="17%" align="right">�����Ա����</td>
        <td width="16%"> <%=sjrysl%> </td>
      </tr>
      <tr>
        <td align="right" width="17%"><font color="#0000CC">Ŀ���ֵ�����</font></td>
        <td width="17%"><%=mbczdcl%> </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">ƽ������</font></td>
        <td width="17%"> <%=pjde%> </td>
        <td width="16%" align="right"><font color="#0000CC">�ɵ�����</font></td>
        <td width="17%"> <%=scbcdbl%> </td>
        <td width="17%" align="right"><font color="#0000CC">���ʦ�˾���ֵ</font></td>
        <td width="16%"> <%=sjsrjcz%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">ǩ������</td>
        <td width="17%"> <%=qdgs%> </td>
        <td width="16%" align="right"><font color="#0000CC">�г���ƽ������</font></td>
        <td width="17%"> <%=scbpjde%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>��ɴ������</td>
        <td width="16%"> <%=wcdbrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">������ȡ����</td>
        <td width="17%"> <%=sqdj%> </td>
        <td width="16%" align="right">����������</td>
        <td width="17%"> <%=kllzs%> </td>
        <td width="17%" align="right"><font color="#0000CC">�����</font></td>
        <td width="16%"> <%=sjsdcl%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�����ۼƶ���</td>
        <td width="17%"> <%=ljdj%> </td>
        <td width="16%" align="right"><font color="#0000CC">�г���ռ��������</font></td>
        <td width="17%"> <%=scbkllb%> </td>
        <td width="17%" align="right">���ֵ��Ա��</td>
        <td width="16%"> <%=lczrs%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">δ������ǩ����</td>
        <td width="17%"> <%=wjdjqds%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ������</font></td>
        <td width="17%"> <%=scbqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">���ֵ��Ա����</font></td>
        <td width="16%"> <%=lczrrbl%> </td>
      </tr>
      <tr  align="center"> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���μ����μ��������ʦ����ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ��ֵ</td>
        <td width="17%"> <%=zrsjscz%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�����ֵ����</font></td>
        <td width="17%"> <%=zdmczb%> </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ������</font></td>
        <td width="16%"> <%=zrsjspjde%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�����г�����ֵ</td>
        <td width="17%"> <%=zrscbcz%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ�г�����ֵ����</font></td>
        <td width="17%"> <%=zscbczb%> </td>
        <td width="17%" align="right">������Ʒ�����</td>
        <td width="16%"> <%=zsjfzsrb%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ��ȡ����</td>
        <td width="17%"> <%=zrsjsdj%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ���涨�����</font></td>
        <td width="17%"> <%=zdmdjb%> </td>
        <td width="17%" align="right"><font color="#0000CC">ռ��Ʒ��������</font></td>
        <td width="16%"> <%=zrsjsmj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦ����</td>
        <td width="17%"> <%=zrsjsrs%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ����������</font></td>
        <td width="17%"> <%=zzrsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ��ÿƽ����Ʒ�</font></td>
        <td width="16%"> <%=zrsjspmsjf%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">�������ʦǩ����</td>
        <td width="17%"> <%=zrsjsqds%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ��������</font></td>
        <td width="17%"> <%=zzqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">�������ʦ�˾���ֵ</font></td>
        <td width="16%"> <%=zrrjcz%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%">����Ʒ����</td>
        <td width="17%"> <%=zrsjssjf%> </td>
        <td width="16%" align="right">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="17%" align="right">&nbsp;</td>
        <td width="16%">&nbsp; </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>��Ʒѷ���ͳ��</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%">������Ʒ�����</td>
        <td width="17%"> <%=sjfsr%> </td>
        <td width="16%" align="right">��ȡ��Ʒѵ���</td>
        <td width="17%"> <%=sqsjfds%> </td>
        <td width="17%" align="right">����ȡ��Ʒ����</td>
        <td width="16%"> <%=sqsjfmj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#0000CC">ƽ��ÿ����Ʒ�</font></td>
        <td width="17%"> <%=pjmhsjf%> </td>
        <td width="16%" align="right"><font color="#0000CC">ռ��ǩ��������</font></td>
        <td width="17%"> <%=sjfzqdsb%> </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ��ÿƽ����Ʒ�</font></td>
        <td width="16%"> <%=pjpmsjf%> </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>5S��Ʒ�����в�Ʒ����</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>5S��Ʒ���۽��</td>
        <td width="17%"> <%=spxse%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>���в�Ʒ���۽��</td>
        <td width="17%"> <%=zycpxse%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>��ɿ�����Ա����</td>
        <td width="16%"> <%=wckhrysl%> </td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>���ܷ���</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>����ܲ�ֵ</td>
        <td width="17%"> <%=wczcz%> </td>
        <td width="16%" align="right">��������</td>
        <td width="17%"> <%=wczmj%> </td>
        <td width="17%" align="right"><font color="#0000CC">ƽ���׺�ͬ���</font></td>
        <td width="16%"> <%=pfmhtzj%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>��ͬ��</td>
        <td width="17%"> <%=ytb%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>�»���</td>
        <td width="17%"> <%=yhb%> </td>
        <td width="17%" align="center">&nbsp;</td>
        <td width="16%">&nbsp;</td>
      </tr>
      <tr> 
        <td align="center" colspan="6" height="24" bgcolor="#CCCCCC"><b>����Ԥ�����</b></td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>���²�ֵԤ��</td>
        <td width="17%"> <%=cyczyg%> </td>
        <td width="16%" align="right"><font color="#FF0033">*</font>���¶���Ԥ��</td>
        <td width="17%"> <%=cydjyg%> </td>
        <td width="17%" align="right"><font color="#FF0033">*</font>�г������²�ֵԤ��</td>
        <td width="16%"> <%=scbcyczyg%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>���澭���²�ֵ˵��</td>
        <td colspan="5"><%=byczsm%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>���澭����²�ֵ˵��</td>
        <td colspan="5"><%=cyczsm%> </td>
      </tr>
      <tr> 
        <td align="right" width="17%"><font color="#FF0033">*</font>�������</td>
        <td colspan="5"><%=fzyj%> </td>
      </tr>
    </table>
</CENTER >
</form>
  </body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

