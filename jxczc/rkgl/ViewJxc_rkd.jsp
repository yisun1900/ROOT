<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String rksj=null;
String gysmc=null;
String ckbh=null;
double rkzje=0;
String zcpzje=null;
String ccpzje=null;
String thclzje=null;
String bfclzje=null;
String rklx=null;
String rkcllx=null;
String cgdh=null;
String sgph=null;
String psthph=null;
String ddthph=null;
String thph=null;
String lydh=null;
String dqbm=null;
String rkdzt=null;
String rkr=null;
String rkrssbm=null;
String rkrssfgs=null;
String shr=null;
String shrssbm=null;
String shrssfgs=null;
String shjg=null;
String sfxyzbsh=null;
String xzbshyy=null;
String zbshjg=null;
String zbshr=null;
String zbshrssbm=null;
String zbshrssfgs=null;
String zbshyj=null;
String bz=null;
String sfxnrkd=null;
String glrkph="";
String glckph="";
double yf = 0;
double qtfy = 0;


String rkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select jxc_rkd.yf,jxc_rkd.qtfy,rksj,gysmc,ckmc ckbh,rkzje,zcpzje,ccpzje,thclzje,bfclzje,DECODE(jxc_rkd.rklx,'C','�ɹ����','T','�˻����','R','�������','S','�깺���','J','����ȯ�˻����','D','���Ķ����˻�','Z','ֱ�����') rklx,DECODE(rkcllx,'0','����','1','����') rkcllx,cgdh,sgph,psthph,ddthph,thph,lydh,dqmc dqbm,DECODE(jxc_rkd.rkdzt,'0','δ�ύ','1','�ȴ����','2','�ȴ����','3','�����','4','�Ѹ�ȫ��') rkdzt,rkr,a1.dwmc rkrssbm,a2.dwmc rkrssfgs,shr,a3.dwmc shrssbm,a4.dwmc shrssfgs,shjg,DECODE(sfxyzbsh,'Y','��Ҫ','N','����Ҫ') sfxyzbsh,xzbshyy,zbshjg,zbshr,a5.dwmc zbshrssbm,a6.dwmc zbshrssfgs,zbshyj,jxc_rkd.bz bz,DECODE(jxc_rkd.sfxnrkd,'Y','��','N','��') sfxnrkd ";
	ls_sql+=" from  jxc_rkd,jxc_ckmc,dm_dqbm,sq_dwxx a1,sq_dwxx a2,sq_dwxx a3,sq_dwxx a4,sq_dwxx a5,sq_dwxx a6";
	ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh(+) and jxc_rkd.dqbm=dm_dqbm.dqbm and  (rkph='"+rkph+"')  ";
	ls_sql+=" and jxc_rkd.rkrssbm=a1.dwbh(+) and jxc_rkd.rkrssfgs=a2.dwbh(+) and jxc_rkd.shrssbm=a3.dwbh(+) and jxc_rkd.shrssfgs=a4.dwbh(+) and jxc_rkd.zbshrssbm=a5.dwbh(+) and jxc_rkd.zbshrssfgs=a6.dwbh(+) ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yf=rs.getDouble("yf");
		qtfy=rs.getDouble("qtfy");
		rkzje=rs.getDouble("rkzje");
		rksj=cf.fillNull(rs.getDate("rksj"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		zcpzje=cf.fillNull(rs.getString("zcpzje"));
		ccpzje=cf.fillNull(rs.getString("ccpzje"));
		thclzje=cf.fillNull(rs.getString("thclzje"));
		bfclzje=cf.fillNull(rs.getString("bfclzje"));
		rklx=cf.fillNull(rs.getString("rklx"));
		rkcllx=cf.fillNull(rs.getString("rkcllx"));
		cgdh=cf.fillNull(rs.getString("cgdh"));
		sgph=cf.fillNull(rs.getString("sgph"));
		psthph=cf.fillNull(rs.getString("psthph"));
		ddthph=cf.fillNull(rs.getString("ddthph"));
		thph=cf.fillNull(rs.getString("thph"));
		lydh=cf.fillNull(rs.getString("lydh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		rkdzt=cf.fillNull(rs.getString("rkdzt"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rkrssbm=cf.fillNull(rs.getString("rkrssbm"));
		rkrssfgs=cf.fillNull(rs.getString("rkrssfgs"));
		shr=cf.fillNull(rs.getString("shr"));
		shrssbm=cf.fillNull(rs.getString("shrssbm"));
		shrssfgs=cf.fillNull(rs.getString("shrssfgs"));
		shjg=cf.fillNull(rs.getString("shjg"));
		sfxyzbsh=cf.fillNull(rs.getString("sfxyzbsh"));
		xzbshyy=cf.fillNull(rs.getString("xzbshyy"));
		zbshjg=cf.fillNull(rs.getString("zbshjg"));
		zbshr=cf.fillNull(rs.getString("zbshr"));
		zbshrssbm=cf.fillNull(rs.getString("zbshrssbm"));
		zbshrssfgs=cf.fillNull(rs.getString("zbshrssfgs"));
		zbshyj=cf.fillNull(rs.getString("zbshyj"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxnrkd=cf.fillNull(rs.getString("sfxnrkd"));
	}
	rs.close();
	ps.close();

	String ls="";
	ls_sql="select glrkph";
	ls_sql+=" from  jxc_rkdglrkdh";
	ls_sql+=" where rkph='"+rkph+"'";
	ls_sql+=" order by glrkph ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ls=cf.fillNull(rs.getString("glrkph"));

		glrkph+="<A HREF='/jxcfc/rkgl/ViewJxc_rkd.jsp?rkph="+ls+"'>"+ls+"</A>��";
	}
	rs.close();
	ps.close();

	ls_sql="select glckph";
	ls_sql+=" from  jxc_rkdglckdh";
	ls_sql+=" where rkph='"+rkph+"'";
	ls_sql+=" order by glckph ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ls=cf.fillNull(rs.getString("glckph"));

		glrkph+="<A HREF='/jxcfc/ckgl/ViewJxc_ckd.jsp?ckph="+ls+"'>"+ls+"</A>��";
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��ⵥ��������ţ�<%=rkph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����      </td>
  <td width="32%"><%=dqbm%> </td>
  <td align="right" width="18%">��ⵥ״̬</td>
  <td width="32%"><%=rkdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������� </td>
  <td><%=rkcllx%></td>
  <td align="right">�������</td>
  <td><%=rklx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ������λ </td>
  <td><%=gysmc%> </td>
  <td align="right"> ���ֿ� </td>
  <td><%=ckbh%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ��</td>
  <td><%=rksj%></td>
  <td align="right">�����</td>
  <td><%=rkr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ������������� </td>
  <td><%=rkrssbm%> </td>
  <td align="right"> ����������ֹ�˾ </td>
  <td><%=rkrssfgs%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����ܽ��  </td>
  <td width="32%"> 
    <%=rkzje%>  </td>
  <td align="right" width="18%"><strong>�ϼ�</strong></td>
  <td width="32%"><%=cf.round(rkzje+yf+qtfy,2)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�˷�</td>
  <td><%=yf%></td>
  <td align="right">��������</td>
  <td><%=qtfy%></td>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ�����</td>
  <td width="32%"><%=cgdh%></td>
  <td align="right" width="18%">�깺���� </td>
  <td width="32%"><%=sgph%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����˻������</td>
  <td width="32%"><%=psthph%></td>
  <td align="right" width="18%">�����˻�����</td>
  <td width="32%"><%=ddthph%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�˻�����</td>
  <td width="32%"><%=thph%></td>
  <td align="right" width="18%">��Դ����</td>
  <td width="32%"><%=lydh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����  </td>
  <td width="32%"> 
    <%=shr%>  </td>
  <td align="right" width="18%"> 
    �������������  </td>
  <td width="32%"> 
    <%=shrssbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����������ֹ�˾  </td>
  <td width="32%"> 
    <%=shrssfgs%>  </td>
  <td align="right" width="18%"> 
    ��˽��  </td>
  <td width="32%"> 
    <%=shjg%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ܲ����ԭ��</td>
  <td colspan="3"><font color=red><%=xzbshyy%></font></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ���Ҫ�ܲ����  </td>
  <td width="32%"> 
    <%=sfxyzbsh%>  </td>
  <td align="right" width="18%">�ܲ�������</td>
  <td width="32%"><%=zbshyj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ܲ���˽��  </td>
  <td width="32%"> 
    <%=zbshjg%>  </td>
  <td align="right" width="18%"> 
    �ܲ������  </td>
  <td width="32%"> 
    <%=zbshr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ܲ��������������  </td>
  <td width="32%"> 
    <%=zbshrssbm%>  </td>
  <td align="right" width="18%"> 
    �ܲ�����������ֹ�˾  </td>
  <td width="32%"> 
    <%=zbshrssfgs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������ⵥ</td>
  <td colspan="3"><%=sfxnrkd%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����������ⵥ��</td>
  <td colspan="3"><%=glrkph%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����������ⵥ��</td>
  <td colspan="3"><%=glckph%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="7%">���ϱ���</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="11%">��������</td>
	<td  width="9%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">�������</td>
	<td  width="6%">�����</td>
	<td  width="5%">���˷�����</td>
	<td  width="6%">���˷������</td>
	<td  width="6%">��������</td>
	<td  width="8%">��������</td>
	<td  width="8%">������</td>
	<td  width="7%">����λ</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jxc_rkmx.rkxh,jxc_rkmx.clbm,nbbm,clmc,xh,gg,TO_CHAR(jxc_rkmx.rkj),jxc_rkmx.rksl,jxc_rkmx.rkje,TO_CHAR(jxc_rkmx.yfrkj),round(jxc_rkmx.yfrkj*jxc_rkmx.rksl,2),to_char(scrq,'YYYY-MM-DD'),scph,hjmc,hwmc ";
	ls_sql+=" FROM jxc_rkmx,jxc_hjmc,jxc_hwmc  ";
    ls_sql+=" where jxc_rkmx.rkph='"+rkph+"' ";
    ls_sql+=" and jxc_rkmx.hjbh=jxc_hjmc.hjbh(+) and jxc_rkmx.hwbh=jxc_hwmc.hwbh(+) ";
    ls_sql+=" order by jxc_rkmx.rkxh ";
    pageObj.sql=ls_sql;

	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</html>