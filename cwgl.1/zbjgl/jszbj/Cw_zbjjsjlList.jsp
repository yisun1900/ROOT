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
	String cw_zbjjsjl_xuhao=null;
	String cw_zbjjsjl_sgd=null;
	String cw_zbjjsjl_zbjjsyybm=null;
	String cw_zbjjsjl_je=null;
	String cw_zbjjsjl_lrr=null;
	String cw_zbjjsjl_lrsj=null;
	cw_zbjjsjl_xuhao=request.getParameter("cw_zbjjsjl_xuhao");
	if (cw_zbjjsjl_xuhao!=null)
	{
		cw_zbjjsjl_xuhao=cw_zbjjsjl_xuhao.trim();
		if (!(cw_zbjjsjl_xuhao.equals("")))	wheresql+=" and (cw_zbjjsjl.xuhao="+cw_zbjjsjl_xuhao+") ";
	}
	cw_zbjjsjl_sgd=request.getParameter("cw_zbjjsjl_sgd");
	if (cw_zbjjsjl_sgd!=null)
	{
		cw_zbjjsjl_sgd=cf.GB2Uni(cw_zbjjsjl_sgd);
		if (!(cw_zbjjsjl_sgd.equals("")))	wheresql+=" and  (cw_zbjjsjl.sgd='"+cw_zbjjsjl_sgd+"')";
	}
	cw_zbjjsjl_zbjjsyybm=request.getParameter("cw_zbjjsjl_zbjjsyybm");
	if (cw_zbjjsjl_zbjjsyybm!=null)
	{
		cw_zbjjsjl_zbjjsyybm=cf.GB2Uni(cw_zbjjsjl_zbjjsyybm);
		if (!(cw_zbjjsjl_zbjjsyybm.equals("")))	wheresql+=" and  (cw_zbjjsjl.zbjjsyybm='"+cw_zbjjsjl_zbjjsyybm+"')";
	}
	cw_zbjjsjl_je=request.getParameter("cw_zbjjsjl_je");
	if (cw_zbjjsjl_je!=null)
	{
		cw_zbjjsjl_je=cw_zbjjsjl_je.trim();
		if (!(cw_zbjjsjl_je.equals("")))	wheresql+=" and  (cw_zbjjsjl.je="+cw_zbjjsjl_je+") ";
	}
	cw_zbjjsjl_lrr=request.getParameter("cw_zbjjsjl_lrr");
	if (cw_zbjjsjl_lrr!=null)
	{
		cw_zbjjsjl_lrr=cf.GB2Uni(cw_zbjjsjl_lrr);
		if (!(cw_zbjjsjl_lrr.equals("")))	wheresql+=" and  (cw_zbjjsjl.lrr='"+cw_zbjjsjl_lrr+"')";
	}
	cw_zbjjsjl_lrsj=request.getParameter("cw_zbjjsjl_lrsj");
	if (cw_zbjjsjl_lrsj!=null)
	{
		cw_zbjjsjl_lrsj=cw_zbjjsjl_lrsj.trim();
		if (!(cw_zbjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zbjjsjl.lrsj=TO_DATE('"+cw_zbjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_zbjjsjl.xuhao,sq_sgd.sgdmc,dm_zbjjsyybm.zbjjsyymc,cw_zbjjsjl.je,cw_zbjjsjl.lrr,cw_zbjjsjl.lrsj,cw_zbjjsjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjjsjl  ";
    ls_sql+=" where cw_zbjjsjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbjjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zbjjsjlList.jsp","SelectCw_zbjjsjl.jsp","","EditCw_zbjjsjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xuhao","sq_sgd_sgdmc","dm_zbjjsyybm_zbjjsyymc","cw_zbjjsjl_je","cw_zbjjsjl_lrr","cw_zbjjsjl_lrsj","cw_zbjjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_zbjjsjl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String[] xuhao = request.getParameterValues("xuhao");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xuhao,"xuhao"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_zbjjsjl where "+chooseitem;
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
	<td  width="8%">���</td>
	<td  width="8%">ʩ����</td>
	<td  width="14%">�ʱ������ԭ��</td>
	<td  width="14%">���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="30%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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