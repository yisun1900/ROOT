<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String fgs=request.getParameter("fgs");

	String wheresql="";
	String ls_sql=null;
	if (!(fgs.equals("")))
	{
		wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>����ͳ�Ʊ�
  <BR>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="9%" rowspan="3">�ֹ�˾</td>
          <td  width="6%" rowspan="3">ǩԼ��</td>
          <td  width="8%" rowspan="3">ǩԼ��</td>
          <td colspan="4">δ��������</td>
          <td colspan="3">��ʩ������</td>
          <td colspan="4">���ڿ�������</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td colspan="2">����֮ǰδ��</td>
          <td colspan="2">����ǩ��δ��</td>
          <td width="7%" rowspan="2">5�������¿�������</td>
          <td width="7%" rowspan="2">6����ʩ����</td>
          <td width="7%" rowspan="2">7����ʩ����</td>
          <td colspan="2">���ڿ���δ���㹤��</td>
          <td colspan="2">������Ṥ��</td>
        </tr>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="7%">1��δ���׿�</td>
          <td width="7%">2���ѽ��׿�</td>
          <td width="7%">3��δ���׿�</td>
          <td width="7%">4���ѽ��׿�</td>
          <td width="7%">8���������ڿ������أ�δ���ڣ�</td>
          <td width="7%">9�����ڿ�������</td>
          <td width="7%">10������������Ṥ�أ�δ���ڣ�</td>
          <td width="7%">11��������Ṥ��</td>
        </tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String fgsbh=null;
String fgsmc=null;

int qys=0;
double qye=0;

int qqwjk=0;//ǰ��δ���׿�
int qqyjk=0;//ǰ���ѽ��׿�
int bqwjk=0;//����δ���׿�
int bqyjk=0;//�����ѽ��׿�

int bqxk=0;//�����¿�������
int zsyl=0;//��ʩ����
int zsyq=0;//��ʩ����

int zcjg=0;//��������
int yqjg=0;//���ڿ���
int zcwj=0;//�������
int yqwj=0;//�������


int allqys=0;//��ǩԼ��
double allqye=0;//��ǩԼ��

int allqqwjk=0;//ǰ��δ���׿�
int allqqyjk=0;//ǰ���ѽ��׿�
int allbqwjk=0;//����δ���׿�
int allbqyjk=0;//�����ѽ��׿�

int allbqxk=0;//�����¿�������
int allzsyl=0;//��ʩ����
int allzsyq=0;//��ʩ����

int allzcjg=0;//��������
int allyqjg=0;//���ڿ���
int allzcwj=0;//�������
int allyqwj=0;//�������

try {
	conn=cf.getConnection();
	ls_sql="SELECT sq_dwxx.dwmc fgs,sq_dwxx.dwbh fgsbh ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");

		//ǩԼ�� ǩԼ�� 
		ls_sql="select count(*) qye,sum(qye) qye";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' ";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt(1);
			qye=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();
		
		allqys+=qys;
		allqye+=qye;

		//ǰ��δ���׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qqwjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allqqwjk+=qqwjk;

		//ǰ���ѽ��׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qqyjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allqqyjk+=qqyjk;

		//����δ���׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and (cwsfke<=100 OR cwsfke is null)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqwjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allbqwjk+=bqwjk;

		//�����ѽ��׿�
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='1'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cwsfke>100 ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqyjk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		allbqyjk+=bqyjk;

		//�����¿�������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and sjkgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD') ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			bqxk=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allbqxk+=bqxk;

		//��ʩ����
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and sjkgrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and (TO_DATE('"+sjfw2+"','YYYY-MM-DD')-sjkgrq) <= (jgrq-kgrq)+NVL(hzts,0) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsyl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsyl+=zsyl;

		//��ʩ����
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm in('2','3','6')";
		ls_sql+=" and (TO_DATE('"+sjfw2+"','YYYY-MM-DD')-sjkgrq) > (jgrq-kgrq)+NVL(hzts,0) ";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zsyq=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzsyq+=zsyq;

		//��������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zcjg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzcjg+=zcjg;

		//���ڿ���
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='4'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			yqjg=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allyqjg+=yqjg;

		//�������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq <= jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zcwj=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allzcwj+=zcwj;

		//�������
		ls_sql="select count(*)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where  crm_khxx.fgsbh='"+fgsbh+"' and zt='2' and crm_khxx.gcjdbm='5'";
		ls_sql+=" and sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq-sjkgrq > jgrq-kgrq+NVL(hzts,0)";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			yqwj=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		allyqwj+=yqwj;
%>
		<tr align="center">
          <td><%=fgsmc%></td>
          <td ><A HREF="Crm_khxxxQd.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qys%></A></td>
          <td><%=cf.formatDouble((int)qye)%></td>
          <td align="right"><A HREF="Crm_khxxxQqwjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qqwjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxQqyjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=qqyjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxBqwjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqwjk%></A></td>
          <td align="right"><A HREF="Crm_khxxxBqyjk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqyjk%></A></td>

          <td align="right"><A HREF="Crm_khxxxBqxk.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=bqxk%></A></td>
          <td align="right"><A HREF="Crm_khxxxZsyl.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsyl%></A></td>
          <td align="right"><A HREF="Crm_khxxxZsyq.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zsyq%></A></td>

          <td align="right"><A HREF="Crm_khxxxZcjg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zcjg%></A></td>
          <td align="right"><A HREF="Crm_khxxxYqjg.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=yqjg%></A></td>
          <td align="right"><A HREF="Crm_khxxxZcwj.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=zcwj%></A></td>
          <td align="right"><A HREF="Crm_khxxxYqwj.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgs=<%=fgsbh%>" target="_blank"><%=yqwj%></A></td>
        </tr>
<%
	}
	ps.close();
	rs.close();
%>

        <tr align="center" >
          <td><font color=red><B>�ܼ�</B></font></td>
          <td><B><%=allqys%></B></td>
          <td><B><%=cf.formatDouble((int)allqye)%></B></td>
          <td><B><%=allqqwjk%></B></td>
          <td><B><%=allqqyjk%></B></td>
          <td><B><%=allbqwjk%></B></td>
          <td><B><%=allbqyjk%></B></td>

          <td><B><%=allbqxk%></B></td>
          <td><B><%=allzsyl%></B></td>
          <td><B><%=allzsyq%></B></td>

          <td><B><%=allzcjg%></B></td>
          <td><B><%=allyqjg%></B></td>
          <td><B><%=allzcwj%></B></td>
          <td><B><%=allyqwj%></B></td>
        </tr>
        <tr align="center" >
          <td colspan="3"><font color=red><B>�� �� �� ��</B></font></td>
          <td colspan="4"><B><%=(allqqwjk+allqqyjk+allbqwjk+allbqyjk)%></B></td>

          <td colspan="3"><B><%=(allbqxk+allzsyl+allzsyq)%></B></td>

          <td colspan="4"><B><%=(allzcjg+allyqjg+allzcwj+allyqwj)%></B></td>
        </tr>

<%}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>
</body>
</html>

&nbsp;<br>
˵����

<BR>������ָ��[<%=sjfw%>]--[<%=sjfw2%>]֮�䡣												
<BR>����֮ǰ��ָ��[<%=sjfw%>]֮ǰ��												
<BR>��ͬ���ڣ���ͬ��������ͬ������												
<BR>ʵ�ʹ��ڣ�ʵ�ʿ�����ʵ�ʿ������깤�� �� [<%=sjfw2%>]��ʵ�ʿ�����δ�깤����												
<BR>�Ϸ����ڣ���ͬ���ڣ����ڵ�������												
<BR>1������֮ǰ��ǩ��δ�������ڿ��δ������������												
<BR>2������֮ǰ��ǩ���ѽ������ڿ��δ������������												
<BR>4��������ǩ���ѽ������ڿ��δ������������												
<BR>5�����ڿ����Ĺ�������
<BR>6��[<%=sjfw%>]֮ǰ�������أ���[<%=sjfw2%>]ʱδ�깤����ʵ�ʹ���<�Ϸ����ڡ�
<BR>7����[<%=sjfw2%>]ʱδ�깤���أ���ʵ�ʹ���>�Ϸ����ڡ�
<BR>8�����ڰ���������δ�������Ĺ��ز���ʵ�ʿ������ڲ����ںϷ����ڵġ���δ���ڣ�
<BR>9�����ڰ���������δ�������Ĺ��ز���ʵ�ʿ������ڴ��ںϷ����ڵġ������ڣ�
<BR>10���ͻ��ڱ��ڽ�����ȫ���Ŀ������������������Ĺ��ز���ʵ�ʿ������ڲ����ںϷ����ڵġ���δ���ڣ�
<BR>11���ͻ��ڱ��ڽ�����ȫ���Ŀ������������������Ĺ��ز���ʵ�ʿ������ڴ��ںϷ����ڵġ������ڣ�
