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
	String jc_cgdqbj_dqbm=null;
	String jc_cgdqbj_dqmc=null;
	String jc_cgdqbj_dqlbbm=null;
	String jc_cgdqbj_xh=null;
	String jc_cgdqbj_gg=null;
	String jc_cgdqbj_jldw=null;
	String jc_cgdqbj_cptz=null;
	String jc_cgdqbj_cd=null;
	String jc_cgdqbj_lsj=null;
	String jc_cgdqbj_yhj=null;
	String jc_cgdqbj_dwbh=null;
	jc_cgdqbj_dqbm=request.getParameter("jc_cgdqbj_dqbm");
	if (jc_cgdqbj_dqbm!=null)
	{
		jc_cgdqbj_dqbm=cf.GB2Uni(jc_cgdqbj_dqbm);
		if (!(jc_cgdqbj_dqbm.equals("")))	wheresql+=" and  (jc_cgdqbj.dqbm='"+jc_cgdqbj_dqbm+"')";
	}
	jc_cgdqbj_dqmc=request.getParameter("jc_cgdqbj_dqmc");
	if (jc_cgdqbj_dqmc!=null)
	{
		jc_cgdqbj_dqmc=cf.GB2Uni(jc_cgdqbj_dqmc);
		if (!(jc_cgdqbj_dqmc.equals("")))	wheresql+=" and  (jc_cgdqbj.dqmc='"+jc_cgdqbj_dqmc+"')";
	}
	jc_cgdqbj_dqlbbm=request.getParameter("jc_cgdqbj_dqlbbm");
	if (jc_cgdqbj_dqlbbm!=null)
	{
		jc_cgdqbj_dqlbbm=cf.GB2Uni(jc_cgdqbj_dqlbbm);
		if (!(jc_cgdqbj_dqlbbm.equals("")))	wheresql+=" and  (jc_cgdqbj.dqlbbm='"+jc_cgdqbj_dqlbbm+"')";
	}
	jc_cgdqbj_xh=request.getParameter("jc_cgdqbj_xh");
	if (jc_cgdqbj_xh!=null)
	{
		jc_cgdqbj_xh=cf.GB2Uni(jc_cgdqbj_xh);
		if (!(jc_cgdqbj_xh.equals("")))	wheresql+=" and  (jc_cgdqbj.xh='"+jc_cgdqbj_xh+"')";
	}
	jc_cgdqbj_gg=request.getParameter("jc_cgdqbj_gg");
	if (jc_cgdqbj_gg!=null)
	{
		jc_cgdqbj_gg=cf.GB2Uni(jc_cgdqbj_gg);
		if (!(jc_cgdqbj_gg.equals("")))	wheresql+=" and  (jc_cgdqbj.gg='"+jc_cgdqbj_gg+"')";
	}
	jc_cgdqbj_jldw=request.getParameter("jc_cgdqbj_jldw");
	if (jc_cgdqbj_jldw!=null)
	{
		jc_cgdqbj_jldw=cf.GB2Uni(jc_cgdqbj_jldw);
		if (!(jc_cgdqbj_jldw.equals("")))	wheresql+=" and  (jc_cgdqbj.jldw='"+jc_cgdqbj_jldw+"')";
	}
	jc_cgdqbj_cptz=request.getParameter("jc_cgdqbj_cptz");
	if (jc_cgdqbj_cptz!=null)
	{
		jc_cgdqbj_cptz=cf.GB2Uni(jc_cgdqbj_cptz);
		if (!(jc_cgdqbj_cptz.equals("")))	wheresql+=" and  (jc_cgdqbj.cptz='"+jc_cgdqbj_cptz+"')";
	}
	jc_cgdqbj_cd=request.getParameter("jc_cgdqbj_cd");
	if (jc_cgdqbj_cd!=null)
	{
		jc_cgdqbj_cd=cf.GB2Uni(jc_cgdqbj_cd);
		if (!(jc_cgdqbj_cd.equals("")))	wheresql+=" and  (jc_cgdqbj.cd='"+jc_cgdqbj_cd+"')";
	}
	jc_cgdqbj_lsj=request.getParameter("jc_cgdqbj_lsj");
	if (jc_cgdqbj_lsj!=null)
	{
		jc_cgdqbj_lsj=jc_cgdqbj_lsj.trim();
		if (!(jc_cgdqbj_lsj.equals("")))	wheresql+=" and  (jc_cgdqbj.lsj="+jc_cgdqbj_lsj+") ";
	}
	jc_cgdqbj_yhj=request.getParameter("jc_cgdqbj_yhj");
	if (jc_cgdqbj_yhj!=null)
	{
		jc_cgdqbj_yhj=jc_cgdqbj_yhj.trim();
		if (!(jc_cgdqbj_yhj.equals("")))	wheresql+=" and  (jc_cgdqbj.yhj="+jc_cgdqbj_yhj+") ";
	}
	jc_cgdqbj_dwbh=request.getParameter("jc_cgdqbj_dwbh");
	if (jc_cgdqbj_dwbh!=null)
	{
		jc_cgdqbj_dwbh=cf.GB2Uni(jc_cgdqbj_dwbh);
		if (!(jc_cgdqbj_dwbh.equals("")))	wheresql+=" and  (jc_cgdqbj.dwbh='"+jc_cgdqbj_dwbh+"')";
	}
	ls_sql="SELECT jc_cgdqbj.dqbm,jc_cgdqbj.dqmc,jdm_dqlbbm.dqlbmc,jc_cgdqbj.xh,jc_cgdqbj.gg,jc_cgdqbj.jldw,jc_cgdqbj.cptz,jc_cgdqbj.cd,jc_cgdqbj.lsj,jc_cgdqbj.yhj,sq_dwxx.dwmc,jc_cgdqbj.zp,jc_cgdqbj.bz  ";
	ls_sql+=" FROM sq_dwxx,jdm_dqlbbm,jc_cgdqbj  ";
    ls_sql+=" where jc_cgdqbj.dwbh=sq_dwxx.dwbh and jc_cgdqbj.dqlbbm=jdm_dqlbbm.dqlbbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdqbj.dqbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgdqbjList.jsp","SelectJc_cgdqbj.jsp","","EditJc_cgdqbj.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","jc_cgdqbj_dqmc","jdm_dqlbbm_dqlbmc","jc_cgdqbj_xh","jc_cgdqbj_gg","jc_cgdqbj_jldw","jc_cgdqbj_cptz","jc_cgdqbj_cd","jc_cgdqbj_lsj","jc_cgdqbj_yhj","sq_dwxx_dwmc","jc_cgdqbj_zp","jc_cgdqbj_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dqbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_cgdqbjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] dqbm = request.getParameterValues("dqbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dqbm,"dqbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_cgdqbj where "+chooseitem;
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">�������</td>
	<td  width="8%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="6%">������λ</td>
	<td  width="16%">��Ʒ����</td>
	<td  width="6%">����</td>
	<td  width="6%">���ۼ�</td>
	<td  width="6%">�Żݼ�</td>
	<td  width="6%">��������</td>
	<td  width="10%">��Ƭ</td>
	<td  width="6%">��ע</td>
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