<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_sfbl_xh=null;
	String bj_sfbl_sfxmbm=null;
	String bj_sfbl_sfbfb=null;
	String bj_sfbl_qsz=null;
	String bj_sfbl_jzz=null;
	String bj_sfbl_dqbm=null;
	bj_sfbl_xh=request.getParameter("bj_sfbl_xh");
	if (bj_sfbl_xh!=null)
	{
		bj_sfbl_xh=bj_sfbl_xh.trim();
		if (!(bj_sfbl_xh.equals("")))	wheresql+=" and (bj_sfbl.xh="+bj_sfbl_xh+") ";
	}
	bj_sfbl_sfxmbm=request.getParameter("bj_sfbl_sfxmbm");
	if (bj_sfbl_sfxmbm!=null)
	{
		bj_sfbl_sfxmbm=cf.GB2Uni(bj_sfbl_sfxmbm);
		if (!(bj_sfbl_sfxmbm.equals("")))	wheresql+=" and  (bj_sfbl.sfxmbm='"+bj_sfbl_sfxmbm+"')";
	}
	bj_sfbl_sfbfb=request.getParameter("bj_sfbl_sfbfb");
	if (bj_sfbl_sfbfb!=null)
	{
		bj_sfbl_sfbfb=bj_sfbl_sfbfb.trim();
		if (!(bj_sfbl_sfbfb.equals("")))	wheresql+=" and  (bj_sfbl.sfbfb="+bj_sfbl_sfbfb+") ";
	}
	bj_sfbl_qsz=request.getParameter("bj_sfbl_qsz");
	if (bj_sfbl_qsz!=null)
	{
		bj_sfbl_qsz=bj_sfbl_qsz.trim();
		if (!(bj_sfbl_qsz.equals("")))	wheresql+=" and  (bj_sfbl.qsz="+bj_sfbl_qsz+") ";
	}
	bj_sfbl_jzz=request.getParameter("bj_sfbl_jzz");
	if (bj_sfbl_jzz!=null)
	{
		bj_sfbl_jzz=bj_sfbl_jzz.trim();
		if (!(bj_sfbl_jzz.equals("")))	wheresql+=" and  (bj_sfbl.jzz="+bj_sfbl_jzz+") ";
	}
	bj_sfbl_dqbm=request.getParameter("bj_sfbl_dqbm");
	if (bj_sfbl_dqbm!=null)
	{
		bj_sfbl_dqbm=cf.GB2Uni(bj_sfbl_dqbm);
		if (!(bj_sfbl_dqbm.equals("")))	wheresql+=" and  (bj_sfbl.dqbm='"+bj_sfbl_dqbm+"')";
	}
	ls_sql="SELECT bj_sfbl.xh,dm_dqbm.dqmc,bdm_sfxmbm.sfxmbm,bdm_sfxmbm.sfxmmc,bj_sfbl.sfbfb||'%',bj_sfbl.qsz,bj_sfbl.jzz  ";
	ls_sql+=" FROM bdm_sfxmbm,bj_sfbl,dm_dqbm  ";
    ls_sql+=" where bj_sfbl.dqbm=bdm_sfxmbm.dqbm(+) and bj_sfbl.sfxmbm=bdm_sfxmbm.sfxmbm(+) and bj_sfbl.dqbm=dm_dqbm.dqbm(+)";
 	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}
   ls_sql+=wheresql;
    ls_sql+=" order by bj_sfbl.dqbm,bj_sfbl.sfxmbm,bj_sfbl.qsz";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_sfblList.jsp","","","EditBj_sfbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","bdm_sfxmbm_sfxmmc","bj_sfbl_sfbfb","bj_sfbl_qsz","bj_sfbl_jzz","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_sfblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_sfbl where "+chooseitem;
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
	<td  width="7%">���</td>
	<td  width="10%">��������</td>
	<td  width="12%">�շ���Ŀ����</td>
	<td  width="23%">�շ���Ŀ</td>
	<td  width="10%">�շѰٷֱ�</td>
	<td  width="15%">��ʼֵ></td>
	<td  width="15%">��ֵֹ<=</td>
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