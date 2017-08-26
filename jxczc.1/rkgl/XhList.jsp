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
	String cgjhph=null;
	String jhxh=null;
	String clbm=null;
	String jhcgsl=null;
	String sjcgsl=null;
	cgjhph=request.getParameter("cgjhph");
	if (cgjhph!=null)
	{
		cgjhph=cf.GB2Uni(cgjhph);
		if (!(cgjhph.equals("")))	wheresql+=" and  (jxc_cgjhmx.cgjhph='"+cgjhph+"')";
	}
	jhxh=request.getParameter("jhxh");
	if (jhxh!=null)
	{
		jhxh=jhxh.trim();
		if (!(jhxh.equals("")))	wheresql+=" and (jxc_cgjhmx.jhxh="+jhxh+") ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_cgjhmx.clbm='"+clbm+"')";
	}
	jhcgsl=request.getParameter("jhcgsl");
	if (jhcgsl!=null)
	{
		jhcgsl=jhcgsl.trim();
		if (!(jhcgsl.equals("")))	wheresql+=" and  (jxc_cgjhmx.jhcgsl="+jhcgsl+") ";
	}
	sjcgsl=request.getParameter("sjcgsl");
	if (sjcgsl!=null)
	{
		sjcgsl=sjcgsl.trim();
		if (!(sjcgsl.equals("")))	wheresql+=" and  (jxc_cgjhmx.sjcgsl="+sjcgsl+") ";
	}
	ls_sql="SELECT cgjhph,jhxh,nbbm,clmc,xh,gg,bzgg,jhcgsl,sjcgsl  ";
	ls_sql+=" FROM jxc_cgjhmx,jxc_clbm  ";
    ls_sql+=" where jxc_cgjhmx.clbm=jxc_clbm.clbm ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cgjhph","jhxh","clbm","jhcgsl","sjcgsl"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cgjhph","jhxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"XhList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_cgjhmx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px' >
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">�ɹ��ƻ�����</td>
	<td  width="3%">�ƻ����</td>
	<td  width="8%">�ڲ�����</td>
	<td  width="12%">��������</td>
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="8%">��װ���</td>
	<td  width="5%">�ƻ��ɹ�����</td>
	<td  width="5%">ʵ�ʲɹ�����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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