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
	String bdm_hxfjdzb_hxbm=null;
	String bdm_hxfjdzb_jgwzmc=null;
	String bdm_hxfjdzb_fjlx=null;
	bdm_hxfjdzb_hxbm=request.getParameter("bdm_hxfjdzb_hxbm");
	if (bdm_hxfjdzb_hxbm!=null)
	{
		bdm_hxfjdzb_hxbm=cf.GB2Uni(bdm_hxfjdzb_hxbm);
		if (!(bdm_hxfjdzb_hxbm.equals("")))	wheresql+=" and  (bdm_hxfjdzb.hxbm='"+bdm_hxfjdzb_hxbm+"')";
	}
	bdm_hxfjdzb_jgwzmc=request.getParameter("bdm_hxfjdzb_jgwzmc");
	if (bdm_hxfjdzb_jgwzmc!=null)
	{
		bdm_hxfjdzb_jgwzmc=cf.GB2Uni(bdm_hxfjdzb_jgwzmc);
		if (!(bdm_hxfjdzb_jgwzmc.equals("")))	wheresql+=" and  (bdm_hxfjdzb.jgwzmc='"+bdm_hxfjdzb_jgwzmc+"')";
	}
	bdm_hxfjdzb_fjlx=request.getParameter("bdm_hxfjdzb_fjlx");
	if (bdm_hxfjdzb_fjlx!=null)
	{
		bdm_hxfjdzb_fjlx=bdm_hxfjdzb_fjlx.trim();
		if (!(bdm_hxfjdzb_fjlx.equals("")))	wheresql+=" and (bdm_hxfjdzb.fjlx="+bdm_hxfjdzb_fjlx+") ";
	}
	ls_sql="SELECT bdm_hxfjdzb.hxbm,dm_hxbm.hxmc,bdm_hxfjdzb.jgwzmc,bdm_hxfjdzb.fjmj, DECODE(bdm_hxfjdzb.fjlx,'1','����','2','������','3','����','4','����','5','����','6','��̨'),bdm_hxfjdzb.xuhao  ";
	ls_sql+=" FROM dm_hxbm,bdm_hxfjdzb  ";
    ls_sql+=" where bdm_hxfjdzb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bdm_hxfjdzb.hxbm,bdm_hxfjdzb.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bdm_hxfjdzbList.jsp","","","EditBdm_hxfjdzb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"hxbm","dm_hxbm_hxmc","jgwzmc","bdm_hxfjdzb_fjmj","bdm_hxfjdzb_fjlx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"hxbm","jgwzmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bdm_hxfjdzbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bdm_hxfjdzb where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="8%">����</td>
	<td  width="20%">����</td>
	<td  width="25%">��������</td>
	<td  width="15%">�������</td>
	<td  width="15%">��������</td>
	<td  width="15%">���</td>
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