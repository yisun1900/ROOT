<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="where (yhzbh!='000000')";
	String yhzbh=null;
	String yhzmc=null;
	String yhzms=null;

	String jb=null;
	jb=request.getParameter("jb");
	if (jb!=null)
	{
		jb=cf.GB2Uni(jb);
		if (!(jb.equals("")))	wheresql+="  and (jb='"+jb+"')";
	}
	
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		yhzbh=cf.GB2Uni(yhzbh);
		if (!(yhzbh.equals("")))	wheresql+="  and (yhzbh='"+yhzbh+"')";
	}
	yhzmc=request.getParameter("yhzmc");
	if (yhzmc!=null)
	{
		yhzmc=cf.GB2Uni(yhzmc);
		if (!(yhzmc.equals("")))	wheresql+=" and  (yhzmc='"+yhzmc+"')";
	}
	yhzms=request.getParameter("yhzms");
	if (yhzms!=null)
	{
		yhzms=cf.GB2Uni(yhzms);
		if (!(yhzms.equals("")))	wheresql+=" and  (yhzms='"+yhzms+"')";
	}
	ls_sql="SELECT '�鿴' sq,yhzbh,yhzmc,DECODE(jb,'1','��ͨ','9','����','2','��Ӧ��'),yhzms  ";
	ls_sql+=" FROM sq_yhz  ";
    ls_sql+=wheresql;
	ls_sql+=" order by yhzbh  ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_yhzList.jsp","","","EditSq_yhz.jsp");
/*
//������ʾ��
	String[] disColName={"yhzbh","yhzmc","yhzms"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yhzbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Sq_yhzList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yhzbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewUsertogroup.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sq",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] yhzbh = request.getParameterValues("yhzbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(yhzbh,"yhzbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[3];//Ҫִ�е�SQL
		boolean needCommit=true;//��Ҫ������
		sql[0]="delete from sq_yhssz where yhzbh!='000001' and "+chooseitem;
		sql[1]="delete from sq_yhzqx where yhzbh!='000001' and "+chooseitem;
		sql[2]="delete from sq_yhz where yhzbh!='000001' and "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
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
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%" >&nbsp;</td>
	<td  width="6%">��Ȩ</td>
	<td  width="10%" >�û�����</td>
	<td  width="24%" >�û�������</td>
	<td  width="10%" >����</td>
	<td  width="40%" >�û�������</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>