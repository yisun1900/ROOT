<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
//�������,��ȡ����
	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;
	String hzbh=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");
	String nianyue=null;
	String nianyue2=null;
	nianyue=sjfw.substring(0,4)+sjfw.substring(5,7);
	nianyue2=sjfw2.substring(0,4)+sjfw2.substring(5,7);
//���ÿ���
	if (!(nianyue.equals(nianyue2)))
	{
		out.print("��ѡ��ͬһ���·ݣ����ÿ��£�");
		return;
	}

	String fgs=request.getParameter("fgs");
	hzbh=fgs+nianyue;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>������������
  <BR>(ʱ�䷶Χ��<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="post" action="" name="shform" target="_blank">
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%">��������</td>
	  <td  width="8%">���</td>
	  <td  width="24%">��;/��ʽ</td>
	  <td  width="10%">����</td>
	  <td  width="12%">�ϼ�</td>
	  <td  width="36%">��ע</td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();
	int cs=0;
	double zj=0;
	int row=0;
	String ytxs=null;
	double fy=0;
	String bz=null;
	int allcs=0;
	String yshz=null;
	ls_sql="select count(*) cs,yshz";
	ls_sql+=" from rs_fysh";
	ls_sql+=" where hzbh='"+hzbh+"'  group by yshz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcs=rs.getInt("cs");
		yshz=rs.getString("yshz");
	}
	rs.close();
	ps.close();

//��Ԥ��δ�ύʱ���ء�
	if(allcs==0)
	{
		out.print("����Ԥ�㻹δ�ύ��");
		return;
	}
	if(yshz.equals("03"))
	{
		out.print("����Ԥ��������ͨ����");
		return;
	}	
	if(!(yshz.equals("02")))
	{
		out.print("����Ԥ��δ��ˣ������δͨ����");
		return;
	}

	ls_sql="select count(*) cs,sum(fy) zj";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='01' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		cs=rs.getInt("cs");
		zj=rs.getDouble("zj");
	}
	rs.close();
	ps.close();
	if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">��Ƹ��</td>
<%

	ls_sql="select ytxs,fy,bz";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='01' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	while (rs.next())
	{
		ytxs=rs.getString("ytxs");
		fy=rs.getDouble("fy");
		bz=cf.fillHtml(rs.getString("bz"));
		row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
	}
	rs.close();
	ps.close();
	}

	cs=0;
	zj=0;
	ytxs=null;
	fy=0;
	bz=null;
	row=0;

	ls_sql="select count(*) cs,sum(fy) zj";
	ls_sql+=" from rs_fysq";
	ls_sql+=" where xqlx='02' and rs_fysq.fgs='"+fgs+"' ";
	ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	if (rs.next())
	{
		cs=rs.getInt("cs");
		zj=rs.getDouble("zj");
	}
	rs.close();
	ps.close();
	if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">��ѵ��</td>
<%

ls_sql="select ytxs,fy,bz";
ls_sql+=" from rs_fysq";
ls_sql+=" where xqlx='02' and rs_fysq.fgs='"+fgs+"' ";
ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

	ps = conn.prepareStatement(ls_sql);
	rs = ps.executeQuery();
	while (rs.next())
	{
		ytxs=rs.getString("ytxs");
		fy=rs.getDouble("fy");
		bz=cf.fillHtml(rs.getString("bz"));
		row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='03' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">������</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='03' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}


		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='04' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">������</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='04' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='05' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">��ᱣ�շ�</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='05' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='06' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">����</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='06' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}

		cs=0;
		zj=0;
		ytxs=null;
		fy=0;
		bz=null;
		row=0;

		ls_sql="select count(*) cs,sum(fy) zj";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='07' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
			cs=rs.getInt("cs");
			zj=rs.getDouble("zj");
		}
		rs.close();
		ps.close();

		if(cs!=0){
%>
        <tr align="center" >
          <td rowspan="<%=cs%>">��������</td>
<%

		ls_sql="select ytxs,fy,bz";
		ls_sql+=" from rs_fysq";
		ls_sql+=" where xqlx='07' and rs_fysq.fgs='"+fgs+"' ";
		ls_sql+=" and sqsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sqsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.print(ls_sql);

		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		while (rs.next())
		{
			ytxs=rs.getString("ytxs");
			fy=rs.getDouble("fy");
			bz=cf.fillHtml(rs.getString("bz"));
			row++;
%>

          <td align="center"><%=row%></td>
          <td align="center"><%=ytxs%></td>
          <td align="center"><%=fy%></td>
		  <td align="center"><%=zj%></td>
          <td align="center"><%=bz%></td>
        </tr>
<%
		}
		rs.close();
		ps.close();
		}
%>

</table>
<%		
		String shjl=null;
		String shyj=null;
		String shr=null;
		String shsj=null;
		String spjl=null;
		String spyj=null;
		String spr=null;
		String spsj=null;
		ls_sql="select DECODE(shjl,'1','���ͨ��','2','�����޸�','0','ȡ�����') shjl,shyj,shr,shsj,DECODE(spjl,'1','����ͨ��','2','�������','0','ȡ������') spjl,spyj,spr,spsj ";
		ls_sql+=" from rs_fysh";
		ls_sql+=" where hzbh='"+hzbh+"' ";
		ps = conn.prepareStatement(ls_sql);
		rs = ps.executeQuery();
		if (rs.next())
		{
		 shjl=cf.fillHtml(rs.getString("shjl"));
		 shyj=cf.fillHtml(rs.getString("shyj"));
		 shr=cf.fillHtml(rs.getString("shr"));
		 shsj=cf.fillHtml(rs.getDate("shsj"));
		 spjl=cf.fillHtml(rs.getString("spjl"));
		 spyj=cf.fillHtml(rs.getString("spyj"));
		 spr=cf.fillHtml(rs.getString("spr"));
		 spsj=cf.fillHtml(rs.getDate("spsj"));
		}
		rs.close();
		ps.close();
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%">&nbsp;</td>
	  <td  width="10%">����</td>
	  <td  width="20%">�����</td>
	  <td  width="20%">���ʱ��</td>
	  <td  width="40%">���</td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%"><font color=red>���</font></td>
	  <td  width="10%"><%=shjl%></td>
	  <td  width="20%"><%=shr%></td>
	  <td  width="20%"><%=shsj%></td>
	  <td  width="40%"><%=shyj%></td>
	</tr>
	<tr bgcolor="#CCCCCC"  align="center"> 
	  <td  width="10%"><font color=red>����</font></td>
	  <td  width="10%"><%=spjl%></td>
	  <td  width="20%"><%=spr%></td>
	  <td  width="20%"><%=spsj%></td>
	  <td  width="40%"><%=spyj%></td>
	</tr>
</table>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">������</font></td> 
  <td width="35%"> 
    <input type="text" name="hzbh" value="<%=hzbh%>" size="20" maxlength="10" readonly>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="spjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">����ͨ��</option>
    <option value="2">�������</option>
    <option value="0">ȡ������</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">�����</font></td> 
  <td width="35%"> 
    <input type="text" name="spr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
    <td align="right" width="15%"><font color="#0000FF">���ʱ��</font></td> 
  <td width="35%"> 
    <input type="text" name="spsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="fgs"  value="<%=fgs%>" >
	<input type="hidden" name="sjfw"  value="<%=sjfw%>">
	<input type="button"  value="����" onClick="f_do(shform)" name="button">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>

	 </form>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("��������: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 

<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.button.disabled=true;
	FormName.action="SaveSqsp.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>