<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpsqbh=null;
String fgs=null;
String sqbm=null;
String zbzw=null;
String zprs=null;
String zpfy=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xbyq=null;
String hyyq=null;
String nlyq=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String sqzt=null;
String lrr=null;
String lrsj=null;
String ssfgs=null;
String bz=null;
String shbh=null;
String shyj=null;
String shr=null;
String shsj=null;
String shjl=null;
String shhrs=null;
String ztbm=null;
String sjzprs=null;
String sjzpfy=null;
String sjkssj=null;
String sjjssj=null;
String sjzpsj=null;
String zpjglrr=null;
String zpjglsj=null;
String wherezpsqbh=null;
wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select zpsqbh,a.dwmc fgs,b.dwmc sqbm,zbzw,zprs,zpfy,zbly,zbqt,xwdgsj,xbyq,hyyq,nlyq,xl,zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr,rs_zpsq.sqzt sqzt,lrr,lrsj,c.dwmc ssfgs,rs_zpsq.bz,shbh,shyj,shr,shsj,DECODE(shjl,'0','ȡ������','1','���ͨ��') shjl,shhrs,rs_ztbm.ztmc ztbm,sjzprs,sjzpfy,sjkssj,sjjssj,sjzpsj,zpjglrr,zpjglsj ";
	ls_sql+=" from  rs_zpsq,rs_ztbm,sq_dwxx a,sq_dwxx b,sq_dwxx c";
	ls_sql+=" where rs_zpsq.fgs=a.dwbh and rs_zpsq.sqbm=b.dwbh and rs_zpsq.ssfgs=c.dwbh and  (zpsqbh='"+wherezpsqbh+"') and rs_ztbm.ztbm=rs_zpsq.ztbm ";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpsqbh=cf.fillHtml(rs.getString("zpsqbh"));
		fgs=cf.fillHtml(rs.getString("fgs"));
		sqbm=cf.fillHtml(rs.getString("sqbm"));
		zbzw=cf.fillHtml(rs.getString("zbzw"));
		zprs=cf.fillHtml(rs.getString("zprs"));
		zpfy=cf.fillHtml(rs.getString("zpfy"));
		zbly=cf.fillHtml(rs.getString("zbly"));
		zbqt=cf.fillHtml(rs.getString("zbqt"));
		xwdgsj=cf.fillHtml(rs.getDate("xwdgsj"));
		xbyq=cf.fillHtml(rs.getString("xbyq"));
		hyyq=cf.fillHtml(rs.getString("hyyq"));
		nlyq=cf.fillHtml(rs.getString("nlyq"));
		xl=cf.fillHtml(rs.getString("xl"));
		zy=cf.fillHtml(rs.getString("zy"));
		wy=cf.fillHtml(rs.getString("wy"));
		jsjnl=cf.fillHtml(rs.getString("jsjnl"));
		gzjy=cf.fillHtml(rs.getString("gzjy"));
		gx=cf.fillHtml(rs.getString("gx"));
		jn=cf.fillHtml(rs.getString("jn"));
		qt=cf.fillHtml(rs.getString("qt"));
		rygznr=cf.fillHtml(rs.getString("rygznr"));
		sqzt=cf.fillHtml(rs.getString("sqzt"));
		lrr=cf.fillHtml(rs.getString("lrr"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		ssfgs=cf.fillHtml(rs.getString("ssfgs"));
		bz=cf.fillHtml(rs.getString("bz"));
		shbh=cf.fillHtml(rs.getString("shbh"));
		shyj=cf.fillHtml(rs.getString("shyj"));
		shr=cf.fillHtml(rs.getString("shr"));
		shsj=cf.fillHtml(rs.getDate("shsj"));
		shjl=cf.fillHtml(rs.getString("shjl"));
		shhrs=cf.fillHtml(rs.getString("shhrs"));
		ztbm=cf.fillHtml(rs.getString("ztbm"));
		sjzprs=cf.fillHtml(rs.getString("sjzprs"));
		sjzpfy=cf.fillHtml(rs.getString("sjzpfy"));
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjzpsj=cf.fillHtml(rs.getString("sjzpsj"));
		zpjglrr=cf.fillHtml(rs.getString("zpjglrr"));
		zpjglsj=cf.fillHtml(rs.getDate("zpjglsj"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #000000;
	font-family: "����_GB2312";
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �鿴��Ƹ����</div>
<table width="100%" border="1" style="FONT-SIZE:14" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> ������ </td>
    <td width="15%"><%=zpsqbh%> </td>
    <td align="right" width="10%" class="STYLE1"> ����ְ�� </td>
    <td width="15%"><%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zbzw,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> ����ֹ�˾ </td>
    <td width="15%"><%=fgs%> </td>
    <td align="right" width="10%" class="STYLE1"> ���벿�� </td>
    <td width="15%"><%=sqbm%> </td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> ����Ա�� </td>
    <td width="15%"><%=zprs%> </td>
    <td align="right" width="10%" class="STYLE1"> ��Ƹ���� </td>
    <td width="15%"><%=zpfy%> </td>
    <td align="right" width="10%" class="STYLE1"> �������� </td>
    <td width="15%"><%
	cf.selectToken(out,"0+����&1+ȱԱ����&2+�������&3+��������",zbly,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> �������� </td>
    <td width="15%"><%=zbqt%> </td>
  </tr>
  <tr bgcolor="#E0F5FF">
    <td align="right" width="10%" class="STYLE1"> ϣ������ʱ�� </td>
    <td width="15%"><%=xwdgsj%> </td>
    <td align="right" width="10%" class="STYLE1"> ��Ƹ����״̬ </td>
    <td width="15%"><%
	cf.selectToken(out,"01+�ȴ�����&02+��������&03+����ȡ��&04+��ʼ��Ƹ&05+��Ƹ����",sqzt,true);
%>
    </td>
	    <td align="right" width="10%" class="STYLE1"> ����״̬ </td>
    <td width="15%"><%=ztbm%> </td>
	<td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> �Ա�Ҫ�� </td>
    <td width="15%"><%
	cf.selectToken(out,"0+����&1+��&2+Ů",xbyq,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> ����Ҫ�� </td>
    <td width="15%"><%
	cf.selectToken(out,"0+����&1+�ѻ�&2+δ��",hyyq,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> ����Ҫ�� </td>
    <td width="15%"><%=nlyq%> </td>
    <td align="right" width="10%" class="STYLE1"> �������� </td>
    <td width="15%"><%=gzjy%> </td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> ѧ��Ҫ�� </td>
    <td width="15%"><%
	cf.selectToken(out,"0+����&1+��ר&2+��ѧ&3+˶ʿ",xl,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> רҵҪ�� </td>
    <td width="15%"><%=zy%> </td>
    <td align="right" width="10%" class="STYLE1"> �������� </td>
    <td width="15%"><%=wy%> </td>
    <td align="right" width="10%" class="STYLE1"> ��������� </td>
    <td width="15%"><%=jsjnl%> </td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> ����Ҫ�� </td>
    <td width="15%"><%=gx%> </td>
    <td align="right" width="10%" class="STYLE1"> ����Ҫ�� </td>
    <td width="15%"><%=jn%> </td>
    <td align="right" width="10%" class="STYLE1"> ����Ҫ�� </td>
    <td width="15%"><%=qt%> </td>
    <td align="right" width="10%" class="STYLE1"> ����ְ��</td>
    <td width="15%"><%=rygznr%> </td>
  </tr>
  <tr bgcolor="#CBE6E7">
    <td align="right" width="10%" class="STYLE1"> ¼���� </td>
    <td width="15%"><%=lrr%> </td>
    <td align="right" width="10%" class="STYLE1"> ¼��ʱ�� </td>
    <td width="15%"><%=lrsj%> </td>
    <td align="right" width="10%" class="STYLE1"> ¼���˷ֹ�˾ </td>
    <td width="15%"><%=ssfgs%> </td>
    <td align="right" width="10%" class="STYLE1"> ��ע </td>
    <td width="15%"><%=bz%> </td>
  </tr>
  <tr bgcolor="#A5B4BE">
    <td align="right" width="10%" class="STYLE1"> �����˱�� </td>
    <td width="15%"><%=shbh%> </td>
    <td align="right" width="10%" class="STYLE1"> ��������� </td>
    <td width="15%"><%=shyj%> </td>
    <td align="right" width="10%" class="STYLE1"> �������� </td>
    <td width="15%"><%=shr%> </td>
    <td align="right" width="10%" class="STYLE1"> ������ʱ�� </td>
    <td width="15%"><%=shsj%> </td>
  </tr>
  <tr bgcolor="#A5B4BE">
    <td align="right" width="10%" class="STYLE1"> �����˽��� </td>
    <td width="15%"><%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl",shjl,true);
%>
    </td>
    <td align="right" width="10%" class="STYLE1"> ��˺����� </td>
    <td width="15%"><%=shhrs%> </td>
	<td>&nbsp;</td><td>&nbsp;</td>
	<td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> ʵ����Ƹ���� </td>
    <td width="15%"><%=sjzprs%> </td>
    <td align="right" width="10%" class="STYLE1"> ʵ����Ƹ���� </td>
    <td width="15%"><%=sjzpfy%> </td>
    <td align="right" width="10%" class="STYLE1"> ��Ƹ��ʼʱ�� </td>
    <td width="15%"><%=sjkssj%> </td>	
    <td align="right" width="10%" class="STYLE1"> ��Ƹ����ʱ�� </td>
    <td width="15%"><%=sjjssj%> </td>	
  </tr>
  <tr bgcolor="#DFE3E9">
    <td align="right" width="10%" class="STYLE1"> ��Ƹ˵�� </td>
    <td width="15%" colspan="3"><%=sjzpsj%> </td>
    <td align="right" width="10%" class="STYLE1"> ���¼���� </td>
    <td width="15%"><%=zpjglrr%> </td>
    <td align="right" width="10%" class="STYLE1"> ���¼��ʱ�� </td>
    <td width="15%"><%=zpjglsj%> </td>	
  </tr>
</table>
</body>
</html>
