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
	String tc_cxxm_cxxmbm=null;
	String tc_cxxm_dqbm=null;
	String tc_cxxm_bjjbbm=null;
	String tc_cxxm_xmmc=null;
	String tc_cxxm_ppmc=null;
	String tc_cxxm_xh=null;
	String tc_cxxm_jldw=null;
	String tc_cxxm_dj=null;
	String tc_cxxm_lrr=null;
	String tc_cxxm_lrsj=null;
	tc_cxxm_cxxmbm=request.getParameter("tc_cxxm_cxxmbm");
	if (tc_cxxm_cxxmbm!=null)
	{
		tc_cxxm_cxxmbm=cf.GB2Uni(tc_cxxm_cxxmbm);
		if (!(tc_cxxm_cxxmbm.equals("")))	wheresql+=" and  (tc_cxxm.cxxmbm='"+tc_cxxm_cxxmbm+"')";
	}
	tc_cxxm_dqbm=request.getParameter("tc_cxxm_dqbm");
	if (tc_cxxm_dqbm!=null)
	{
		tc_cxxm_dqbm=cf.GB2Uni(tc_cxxm_dqbm);
		if (!(tc_cxxm_dqbm.equals("")))	wheresql+=" and  (tc_cxxm.dqbm='"+tc_cxxm_dqbm+"')";
	}
	tc_cxxm_bjjbbm=request.getParameter("tc_cxxm_bjjbbm");
	if (tc_cxxm_bjjbbm!=null)
	{
		tc_cxxm_bjjbbm=cf.GB2Uni(tc_cxxm_bjjbbm);
		if (!(tc_cxxm_bjjbbm.equals("")))	wheresql+=" and  (tc_cxxm.bjjbbm='"+tc_cxxm_bjjbbm+"')";
	}
	tc_cxxm_xmmc=request.getParameter("tc_cxxm_xmmc");
	if (tc_cxxm_xmmc!=null)
	{
		tc_cxxm_xmmc=cf.GB2Uni(tc_cxxm_xmmc);
		if (!(tc_cxxm_xmmc.equals("")))	wheresql+=" and  (tc_cxxm.xmmc='"+tc_cxxm_xmmc+"')";
	}
	tc_cxxm_ppmc=request.getParameter("tc_cxxm_ppmc");
	if (tc_cxxm_ppmc!=null)
	{
		tc_cxxm_ppmc=cf.GB2Uni(tc_cxxm_ppmc);
		if (!(tc_cxxm_ppmc.equals("")))	wheresql+=" and  (tc_cxxm.ppmc='"+tc_cxxm_ppmc+"')";
	}
	tc_cxxm_xh=request.getParameter("tc_cxxm_xh");
	if (tc_cxxm_xh!=null)
	{
		tc_cxxm_xh=cf.GB2Uni(tc_cxxm_xh);
		if (!(tc_cxxm_xh.equals("")))	wheresql+=" and  (tc_cxxm.xh='"+tc_cxxm_xh+"')";
	}
	tc_cxxm_jldw=request.getParameter("tc_cxxm_jldw");
	if (tc_cxxm_jldw!=null)
	{
		tc_cxxm_jldw=cf.GB2Uni(tc_cxxm_jldw);
		if (!(tc_cxxm_jldw.equals("")))	wheresql+=" and  (tc_cxxm.jldw='"+tc_cxxm_jldw+"')";
	}
	tc_cxxm_dj=request.getParameter("tc_cxxm_dj");
	if (tc_cxxm_dj!=null)
	{
		tc_cxxm_dj=tc_cxxm_dj.trim();
		if (!(tc_cxxm_dj.equals("")))	wheresql+=" and  (tc_cxxm.dj="+tc_cxxm_dj+") ";
	}
	tc_cxxm_lrr=request.getParameter("tc_cxxm_lrr");
	if (tc_cxxm_lrr!=null)
	{
		tc_cxxm_lrr=cf.GB2Uni(tc_cxxm_lrr);
		if (!(tc_cxxm_lrr.equals("")))	wheresql+=" and  (tc_cxxm.lrr='"+tc_cxxm_lrr+"')";
	}
	tc_cxxm_lrsj=request.getParameter("tc_cxxm_lrsj");
	if (tc_cxxm_lrsj!=null)
	{
		tc_cxxm_lrsj=tc_cxxm_lrsj.trim();
		if (!(tc_cxxm_lrsj.equals("")))	wheresql+="  and (tc_cxxm.lrsj=TO_DATE('"+tc_cxxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_cxxm.cxxmbm,tc_cxxm.dqbm,dm_dqbm.dqmc,tc_cxxm.bjjbbm,tc_cxxm.xmmc,tc_cxxm.ppmc,tc_cxxm.xh,tc_cxxm.jldw,tc_cxxm.dj,tc_cxxm.bz,tc_cxxm.lrr,tc_cxxm.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_cxxm  ";
    ls_sql+=" where tc_cxxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_cxxmList.jsp","","","Edittc_cxxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_cxxm_ppmc","tc_cxxm_xh","tc_cxxm_jldw","tc_cxxm_dj","tc_cxxm_bz","tc_cxxm_lrr","tc_cxxm_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cxxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_cxxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_cxxm where "+chooseitem;
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
  <B><font size="3">�ײʹ�����Ŀ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="7%">������Ŀ����</td>
	<td  width="7%">����</td>
	<td  width="7%">����</td>
	<td  width="7%">���ۼ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="7%">Ʒ��</td>
	<td  width="7%">�ͺ�</td>
	<td  width="7%">������λ</td>
	<td  width="7%">����</td>
	<td  width="7%">��ע������˵��</td>
	<td  width="7%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
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