<%@ page contentType="text/html;charset=GBK" %>
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
	String wheresql="";
	String cw_zydm_zydm=null;
	String cw_zydm_xm=null;
	String cw_zydm_dwbh=null;
	cw_zydm_zydm=request.getParameter("cw_zydm_zydm");
	if (cw_zydm_zydm!=null)
	{
		cw_zydm_zydm=cf.GB2Uni(cw_zydm_zydm);
		if (!(cw_zydm_zydm.equals("")))	wheresql+=" and  (cw_zydm.zydm='"+cw_zydm_zydm+"')";
	}
	cw_zydm_xm=request.getParameter("cw_zydm_xm");
	if (cw_zydm_xm!=null)
	{
		cw_zydm_xm=cf.GB2Uni(cw_zydm_xm);
		if (!(cw_zydm_xm.equals("")))	wheresql+=" and  (cw_zydm.xm='"+cw_zydm_xm+"')";
	}
	cw_zydm_dwbh=request.getParameter("cw_zydm_dwbh");
	if (cw_zydm_dwbh!=null)
	{
		cw_zydm_dwbh=cf.GB2Uni(cw_zydm_dwbh);
		if (!(cw_zydm_dwbh.equals("")))	wheresql+=" and  (cw_zydm.dwbh='"+cw_zydm_dwbh+"')";
	}
	ls_sql="SELECT cw_zydm.zydm,cw_zydm.xm,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_zydm  ";
    ls_sql+=" where cw_zydm.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zydmList.jsp","SelectCw_zydm.jsp","","EditCw_zydm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zydm","cw_zydm_xm","cw_zydm_dwbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zydm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_zydmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] zydm = request.getParameterValues("zydm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zydm,"zydm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_zydm where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="29%">ְԱ����</td>
	<td  width="29%">����</td>
	<td  width="29%">ʹ�õ�λ</td>
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
