<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ĩ��ת</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="7%">��ת����</td>
	<td  width="10%">ҵ����תʱ��</td>
	<td  width="7%">��ת��</td>
	<td  width="17%">����ʱ��</td>
	<td  width="10%">���ڽ�ת����</td>
	<td  width="7%">ǩԼ�ͻ�����</td>
	<td  width="14%">ǩԼ�ܶ�</td>
	<td  width="7%">�˵��ͻ�����</td>
	<td  width="14%">�˵��ܶ�</td>
	<td  width="14%">ҵ���ܶ�</td>
	
</tr>


<%
	String dwbh=request.getParameter("dwbh");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql="SELECT jzqs,TO_CHAR(jzrq,'YYYY-MM-DD') jzrq,jzr,czsj,TO_CHAR(sqjzrq,'YYYY-MM-DD') sqjzrq,khzs,qyze,tdkhzs,NVL(tdqyze,0),qyze-NVL(tdqyze,0)";
	ls_sql+=" FROM cw_qmjz";
	ls_sql+="  where dwbh='"+dwbh+"' ";  
    ls_sql+=" order by jzrq desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(12);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jzrq"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_qmjz.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jzrq",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <tr>
          <td height="42" colspan="2" align="center">δ��תҵ��</td>
        </tr>
<%

Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

try {
	conn=cf.getConnection();

	int count=0;
	int curNian=0;
	int curYue=0;
	int curRi=0;
	int curHH=0;
	int ret=0;

		
	//��ȡ�涨��ת����
	ls_sql="select TO_CHAR(SYSDATE,'YYYY') nian,TO_CHAR(SYSDATE,'MM') yue,TO_CHAR(SYSDATE,'DD') ri,TO_CHAR(SYSDATE,'HH24') hh";
	ls_sql+="  from sq_yjjzsj";  
	ls_sql+="  where dwbh='"+dwbh+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		curNian=rs.getInt("nian");//��ǰ��
		curYue=rs.getInt("yue");//��ǰ�·�
		curRi=rs.getInt("ri");//��ǰ����
		curHH=rs.getInt("hh");//��ǰСʱ
	} 
	rs.close();
	ps.close();


	//�ж��Ƿ��н�ת��¼
	ls_sql="select count(*) ";
	ls_sql+=" from cw_qmjz";  
	ls_sql+=" where dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	} 
	rs.close();
	ps.close();

	if (count==0)//û�н�ת��¼��ֻ���ת����
	{
		int jzrq=0;//��ת����
		int jzsj=0;//��תʱ��
		ls_sql="select jzrq,jzsj";
		ls_sql+="  from sq_yjjzsj";  
		ls_sql+="  where dwbh='"+dwbh+"'";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		while (rs.next())
		{
			jzrq=rs.getInt("jzrq");//��ת����
			jzsj=rs.getInt("jzsj");//��תʱ��
			
			%>
			<tr>
			  <td align="right">��תʱ�䣺</td>
			  <td>
				<%=curNian%>��<%=cf.addZero(curYue,2)%>��<%=cf.addZero(jzrq,2)%>��<%=jzsj%>ʱ
				<input type="hidden" name="nian" value="<%=curNian%>"  >
				<input type="hidden" name="yue" value="<%=cf.addZero(curYue,2)%>"  >
				<input type="hidden" name="rq" value="<%=cf.addZero(jzrq,2)%>"  >
				<input type="hidden" name="sj" value="<%=jzsj%>"  >
			</td>
			</tr>
			<%
		} 
		rs.close();
		ps.close();
	}
	else{
		//���ڽ�ת����
		String sqjzrq="";
		ls_sql="select max(jzrq)";
		ls_sql+=" from cw_qmjz";  
		ls_sql+=" where dwbh=? ";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setString(1,dwbh);
		rs=ps.executeQuery();
		if (rs.next())
		{
			sqjzrq=cf.fillNull(rs.getDate(1));
		} 
		rs.close();
		ps.close();

		int priNian=Integer.parseInt(sqjzrq.substring(0,4));//������
		int priYue=Integer.parseInt(sqjzrq.substring(5,7));//������
		int priRi=Integer.parseInt(sqjzrq.substring(8,10));//������


		
		for (int i=priNian;i<=curNian ;i++ )
		{
			for (int j=1;j<=12 ;j++ )
			{
				int jzrq=0;//��ת����
				int jzsj=0;//��תʱ��
				ls_sql="select jzrq,jzsj";
				ls_sql+="  from sq_yjjzsj";  
				ls_sql+="  where dwbh='"+dwbh+"'";  
				ls_sql+="  order by jzrq ";  
				ps=conn.prepareStatement(ls_sql);  
				rs=ps.executeQuery();
				while (rs.next())
				{
					jzrq=rs.getInt("jzrq");//��ת����
					jzsj=rs.getInt("jzsj");//��תʱ��

					if (i==priNian)//��һ��
					{
						if (j<priYue)
						{
							continue;
						}
					}
					if (i==priNian && j==priYue)//��һ�꣬��һ��
					{
						if (priRi>=jzrq)
						{
							continue;
						}
					}

					if (i==curNian)//���һ��
					{
						if (j>curYue)
						{
							continue;
						}
					}

					if (i==curNian && j==curYue)//����꣬�����
					{
						if (curRi<jzrq)
						{
							continue;
						}

						if (curRi==jzrq && curHH<jzsj)
						{
							continue;
						}
					}

					%>
					<tr>
					  <td align="right">��תʱ�䣺</td>
					  <td>
						<%=i%>��<%=cf.addZero(j,2)%>��<%=cf.addZero(jzrq,2)%>��<%=jzsj%>ʱ	
						<input type="hidden" name="nian" value="<%=i%>"  >
						<input type="hidden" name="yue" value="<%=cf.addZero(j,2)%>"  >
						<input type="hidden" name="rq" value="<%=cf.addZero(jzrq,2)%>"  >
						<input type="hidden" name="sj" value="<%=jzsj%>"  >
					  </td>
					</tr>
					<%

				} 
				rs.close();
				ps.close();
			}
		}

	}

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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
    <tr align="center"> 
      <td height="55" colspan="2"> 
	<input type="hidden" name="dwbh" value="<%=dwbh%>"  >
      <input type="button"  value="ҵ����ת" onClick="f_do(selectform)">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	FormName.action="yjqmjz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
