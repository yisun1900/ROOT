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
	String tckb_kjmxb_hxbm=null;
	String tckb_kjmxb_jgwzbm=null;
	String tckb_kjmxb_mj=null;
	tckb_kjmxb_hxbm=request.getParameter("tckb_kjmxb_hxbm");
	if (tckb_kjmxb_hxbm!=null)
	{
		tckb_kjmxb_hxbm=cf.GB2Uni(tckb_kjmxb_hxbm);
		if (!(tckb_kjmxb_hxbm.equals("")))	wheresql+=" and  (tckb_kjmxb.hxbm='"+tckb_kjmxb_hxbm+"')";
	}
	tckb_kjmxb_jgwzbm=request.getParameter("tckb_kjmxb_jgwzbm");
	if (tckb_kjmxb_jgwzbm!=null)
	{
		tckb_kjmxb_jgwzbm=cf.GB2Uni(tckb_kjmxb_jgwzbm);
		if (!(tckb_kjmxb_jgwzbm.equals("")))	wheresql+=" and  (tckb_kjmxb.jgwzbm='"+tckb_kjmxb_jgwzbm+"')";
	}
	tckb_kjmxb_mj=request.getParameter("tckb_kjmxb_mj");
	if (tckb_kjmxb_mj!=null)
	{
		tckb_kjmxb_mj=tckb_kjmxb_mj.trim();
		if (!(tckb_kjmxb_mj.equals("")))	wheresql+=" and (tckb_kjmxb.mj="+tckb_kjmxb_mj+") ";
	}
	ls_sql="SELECT tckb_kjmxb.hxbm,dm_hxbm.hxmc,tckb_kjmxb.jgwzbm,tckb_kjmxb.mj  ";
	ls_sql+=" FROM dm_hxbm,tckb_kjmxb  ";
    ls_sql+=" where tckb_kjmxb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_kjmxb.hxbm,tckb_kjmxb.jgwzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckb_kjmxbList.jsp","","","EditTckb_kjmxb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"hxmc","jgwzbm","mj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"hxbm","jgwzbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tckb_kjmxbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tckb_kjmxb where "+chooseitem;
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
	<td  width="30%">����</td>
	<td  width="30%">���ܿռ�</td>
	<td  width="22%">�ռ����</td>
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