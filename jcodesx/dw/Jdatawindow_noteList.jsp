<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='txin.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="txin.common.PageObject"/>

<%
	String ls_sql=null;
	String wheresql=" WHERE (1=1) ";
	int curPage=0;
	String pageStr=request.getParameter("curPage");

	if (pageStr!=null)//��x������
	{
		//Ҫ����ʾ�ڼ�ҳ
		curPage=Integer.parseInt(pageStr);
		String chooseitem = request.getParameter("chooseitem");
		ls_sql="delete from jdatawindow_note where "+chooseitem;
		if ((chooseitem!=null)&&(!(chooseitem.equals(""))))//ִ��ɾ������
		{
//			out.println("<BR>ls_sql="+ls_sql);
			Connection conn=cf.getConnection();    //�õ�����
			try{
				pageObject.executeSql(conn,ls_sql);
			}
			catch(Exception e){
				out.println("<BR>ִ��pageObject.executeSql(conn,ls_sql)����"+e);
				out.println("<BR>ls_sql="+ls_sql);
			}
			finally{
				cf.close(conn); //�ͷ�����
			}
			pageObject.afterDelete();
		}
	}
	else//��һ������,��Ҫ��ѯ
	{
		curPage=1;
		String dw_name=null;
		String dw_note=null;
		String dw_sql=null;
		String dw_wheresql=null;
dw_name=request.getParameter("dw_name");
if (dw_name!=null)
{
	dw_name=cf.GB2Uni(dw_name);
	if (!(dw_name.equals("")))	wheresql+="  and (dw_name='"+dw_name+"')";
}
dw_note=request.getParameter("dw_note");
if (dw_note!=null)
{
	dw_note=cf.GB2Uni(dw_note);
	if (!(dw_note.equals("")))	wheresql+=" and  (dw_note='"+dw_note+"')";
}
dw_sql=request.getParameter("dw_sql");
if (dw_sql!=null)
{
	dw_sql=cf.GB2Uni(dw_sql);
	if (!(dw_sql.equals("")))	wheresql+=" and  (dw_sql='"+dw_sql+"')";
}
dw_wheresql=request.getParameter("dw_wheresql");
if (dw_wheresql!=null)
{
	dw_wheresql=cf.GB2Uni(dw_wheresql);
	if (!(dw_wheresql.equals("")))	wheresql+=" and  (dw_wheresql='"+dw_wheresql+"')";
}
	ls_sql="SELECT dw_name,dw_note,dw_sql,dw_wheresql  ";
	ls_sql+=" FROM jdatawindow_note  ";
    ls_sql+=wheresql;
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("Jdatawindow_noteList.jsp","SelectJdatawindow_note.jsp","ViewJdatawindow_note.jsp","EditJdatawindow_note.jsp");
/*
//������ʾ��
	String[] disColName={"dw_name","dw_note","dw_sql","dw_wheresql"};
	pageObject.setDisColName(disColName);
*/

//��������
	String[] keyName={"dw_name"};
	pageObject.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdatawindow_noteList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObject.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObject.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObject.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="18%" height="2">&nbsp;</td>
		<td  width="16%" height="2">DataWindow����</td>
		<td  width="22%" height="2">DataWindow˵��</td>
		<td  width="22%" height="2">DataWindow SQL</td>
		<td  width="22%" height="2">WhereSQL</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>