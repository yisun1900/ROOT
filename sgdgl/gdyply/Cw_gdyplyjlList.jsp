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
	String cw_gdyplyjl_jlh=null;
	String cw_gdyplyjl_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_gdyplyjl_gdyp=null;
	String cw_gdyplyjl_dj=null;
	String cw_gdyplyjl_sl=null;
	String cw_gdyplyjl_je=null;
	String cw_gdyplyjl_jkblr=null;
	String cw_gdyplyjl_jkblsj=null;
	String cw_gdyplyjl_lrr=null;
	String cw_gdyplyjl_lrsj=null;
	String cw_gdyplyjl_lrbm=null;
	String cw_gdyplyjl_jsbz=null;
	String cw_gdyplyjl_jsjlh=null;
	String cw_gdyplyjl_scbz=null;
	String cw_gdyplyjl_scr=null;
	String cw_gdyplyjl_scsj=null;
	cw_gdyplyjl_jlh=request.getParameter("cw_gdyplyjl_jlh");
	if (cw_gdyplyjl_jlh!=null)
	{
		cw_gdyplyjl_jlh=cf.GB2Uni(cw_gdyplyjl_jlh);
		if (!(cw_gdyplyjl_jlh.equals("")))	wheresql+=" and  (cw_gdyplyjl.jlh='"+cw_gdyplyjl_jlh+"')";
	}
	cw_gdyplyjl_sgd=request.getParameter("cw_gdyplyjl_sgd");
	if (cw_gdyplyjl_sgd!=null)
	{
		cw_gdyplyjl_sgd=cf.GB2Uni(cw_gdyplyjl_sgd);
		if (!(cw_gdyplyjl_sgd.equals("")))	wheresql+=" and  (cw_gdyplyjl.sgd='"+cw_gdyplyjl_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_gdyplyjl_gdyp=request.getParameter("cw_gdyplyjl_gdyp");
	if (cw_gdyplyjl_gdyp!=null)
	{
		cw_gdyplyjl_gdyp=cf.GB2Uni(cw_gdyplyjl_gdyp);
		if (!(cw_gdyplyjl_gdyp.equals("")))	wheresql+=" and  (cw_gdyplyjl.gdyp='"+cw_gdyplyjl_gdyp+"')";
	}
	cw_gdyplyjl_dj=request.getParameter("cw_gdyplyjl_dj");
	if (cw_gdyplyjl_dj!=null)
	{
		cw_gdyplyjl_dj=cw_gdyplyjl_dj.trim();
		if (!(cw_gdyplyjl_dj.equals("")))	wheresql+=" and  (cw_gdyplyjl.dj="+cw_gdyplyjl_dj+") ";
	}
	cw_gdyplyjl_sl=request.getParameter("cw_gdyplyjl_sl");
	if (cw_gdyplyjl_sl!=null)
	{
		cw_gdyplyjl_sl=cw_gdyplyjl_sl.trim();
		if (!(cw_gdyplyjl_sl.equals("")))	wheresql+=" and  (cw_gdyplyjl.sl="+cw_gdyplyjl_sl+") ";
	}
	cw_gdyplyjl_je=request.getParameter("cw_gdyplyjl_je");
	if (cw_gdyplyjl_je!=null)
	{
		cw_gdyplyjl_je=cw_gdyplyjl_je.trim();
		if (!(cw_gdyplyjl_je.equals("")))	wheresql+=" and  (cw_gdyplyjl.je="+cw_gdyplyjl_je+") ";
	}
	cw_gdyplyjl_jkblr=request.getParameter("cw_gdyplyjl_jkblr");
	if (cw_gdyplyjl_jkblr!=null)
	{
		cw_gdyplyjl_jkblr=cf.GB2Uni(cw_gdyplyjl_jkblr);
		if (!(cw_gdyplyjl_jkblr.equals("")))	wheresql+=" and  (cw_gdyplyjl.jkblr='"+cw_gdyplyjl_jkblr+"')";
	}
	cw_gdyplyjl_jkblsj=request.getParameter("cw_gdyplyjl_jkblsj");
	if (cw_gdyplyjl_jkblsj!=null)
	{
		cw_gdyplyjl_jkblsj=cw_gdyplyjl_jkblsj.trim();
		if (!(cw_gdyplyjl_jkblsj.equals("")))	wheresql+="  and (cw_gdyplyjl.jkblsj=TO_DATE('"+cw_gdyplyjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_gdyplyjl_lrr=request.getParameter("cw_gdyplyjl_lrr");
	if (cw_gdyplyjl_lrr!=null)
	{
		cw_gdyplyjl_lrr=cf.GB2Uni(cw_gdyplyjl_lrr);
		if (!(cw_gdyplyjl_lrr.equals("")))	wheresql+=" and  (cw_gdyplyjl.lrr='"+cw_gdyplyjl_lrr+"')";
	}
	cw_gdyplyjl_lrsj=request.getParameter("cw_gdyplyjl_lrsj");
	if (cw_gdyplyjl_lrsj!=null)
	{
		cw_gdyplyjl_lrsj=cw_gdyplyjl_lrsj.trim();
		if (!(cw_gdyplyjl_lrsj.equals("")))	wheresql+="  and (cw_gdyplyjl.lrsj=TO_DATE('"+cw_gdyplyjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdyplyjl_lrbm=request.getParameter("cw_gdyplyjl_lrbm");
	if (cw_gdyplyjl_lrbm!=null)
	{
		cw_gdyplyjl_lrbm=cf.GB2Uni(cw_gdyplyjl_lrbm);
		if (!(cw_gdyplyjl_lrbm.equals("")))	wheresql+=" and  (cw_gdyplyjl.lrbm='"+cw_gdyplyjl_lrbm+"')";
	}
	cw_gdyplyjl_jsbz=request.getParameter("cw_gdyplyjl_jsbz");
	if (cw_gdyplyjl_jsbz!=null)
	{
		cw_gdyplyjl_jsbz=cf.GB2Uni(cw_gdyplyjl_jsbz);
		if (!(cw_gdyplyjl_jsbz.equals("")))	wheresql+=" and  (cw_gdyplyjl.jsbz='"+cw_gdyplyjl_jsbz+"')";
	}
	cw_gdyplyjl_jsjlh=request.getParameter("cw_gdyplyjl_jsjlh");
	if (cw_gdyplyjl_jsjlh!=null)
	{
		cw_gdyplyjl_jsjlh=cf.GB2Uni(cw_gdyplyjl_jsjlh);
		if (!(cw_gdyplyjl_jsjlh.equals("")))	wheresql+=" and  (cw_gdyplyjl.jsjlh='"+cw_gdyplyjl_jsjlh+"')";
	}
	cw_gdyplyjl_scbz=request.getParameter("cw_gdyplyjl_scbz");
	if (cw_gdyplyjl_scbz!=null)
	{
		cw_gdyplyjl_scbz=cf.GB2Uni(cw_gdyplyjl_scbz);
		if (!(cw_gdyplyjl_scbz.equals("")))	wheresql+=" and  (cw_gdyplyjl.scbz='"+cw_gdyplyjl_scbz+"')";
	}
	cw_gdyplyjl_scr=request.getParameter("cw_gdyplyjl_scr");
	if (cw_gdyplyjl_scr!=null)
	{
		cw_gdyplyjl_scr=cf.GB2Uni(cw_gdyplyjl_scr);
		if (!(cw_gdyplyjl_scr.equals("")))	wheresql+=" and  (cw_gdyplyjl.scr='"+cw_gdyplyjl_scr+"')";
	}
	cw_gdyplyjl_scsj=request.getParameter("cw_gdyplyjl_scsj");
	if (cw_gdyplyjl_scsj!=null)
	{
		cw_gdyplyjl_scsj=cw_gdyplyjl_scsj.trim();
		if (!(cw_gdyplyjl_scsj.equals("")))	wheresql+="  and (cw_gdyplyjl.scsj=TO_DATE('"+cw_gdyplyjl_scsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_gdyplyjl.jlh,sq_sgd.sgdmc,cw_gdyplyjl.gdyp,cw_gdyplyjl.dj,cw_gdyplyjl.sl,cw_gdyplyjl.je,cw_gdyplyjl.jkblr,cw_gdyplyjl.jkblsj,cw_gdyplyjl.lrr,cw_gdyplyjl.lrsj,dwmc, DECODE(cw_gdyplyjl.jsbz,'0','δ����','1','�ѽ���'),cw_gdyplyjl.jsjlh, DECODE(cw_gdyplyjl.scbz,'N','δɾ��','Y','ɾ��'),cw_gdyplyjl.scr,cw_gdyplyjl.scsj,cw_gdyplyjl.bz  ";
	ls_sql+=" FROM cw_gdyplyjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdyplyjl.sgd=sq_sgd.sgd(+) and cw_gdyplyjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gdyplyjl.jlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_gdyplyjlList.jsp","","","EditCw_gdyplyjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jlh","cw_gdyplyjl_sgd","sq_sgd_sgdmc","cw_gdyplyjl_gdyp","cw_gdyplyjl_dj","cw_gdyplyjl_sl","cw_gdyplyjl_je","cw_gdyplyjl_jkblr","cw_gdyplyjl_jkblsj","cw_gdyplyjl_lrr","cw_gdyplyjl_lrsj","cw_gdyplyjl_lrbm","cw_gdyplyjl_jsbz","cw_gdyplyjl_jsjlh","cw_gdyplyjl_scbz","cw_gdyplyjl_scr","cw_gdyplyjl_scsj","cw_gdyplyjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_gdyplyjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] jlh = request.getParameterValues("jlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jlh,"jlh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_gdyplyjl where "+chooseitem;
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">��¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="8%">������Ʒ</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="4%">���</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="4%">�����־</td>
	<td  width="4%">�����¼��</td>
	<td  width="4%">ɾ����־</td>
	<td  width="4%">ɾ����</td>
	<td  width="6%">ɾ��ʱ��</td>
	<td  width="44%">��ע</td>
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