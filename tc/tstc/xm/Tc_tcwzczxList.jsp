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
	String tc_tcwzczx_bjbbh=null;
	String tc_tcwzczx_dqbm=null;
	String tc_tcwzczx_bjjbbm=null;
	String tc_tcwzczx_xmmc=null;
	String tc_tcwzczx_ppmc=null;
	String tc_tcwzczx_xh=null;
	String tc_tcwzczx_jldw=null;
	String tc_tcwzczx_dj=null;
	String tc_tcwzczx_lrr=null;
	String tc_tcwzczx_lrsj=null;
	tc_tcwzczx_bjbbh=request.getParameter("tc_tcwzczx_bjbbh");
	if (tc_tcwzczx_bjbbh!=null)
	{
		tc_tcwzczx_bjbbh=cf.GB2Uni(tc_tcwzczx_bjbbh);
		if (!(tc_tcwzczx_bjbbh.equals("")))	wheresql+=" and  (tc_tcwzczx.bjbbh='"+tc_tcwzczx_bjbbh+"')";
	}
	tc_tcwzczx_dqbm=request.getParameter("tc_tcwzczx_dqbm");
	if (tc_tcwzczx_dqbm!=null)
	{
		tc_tcwzczx_dqbm=cf.GB2Uni(tc_tcwzczx_dqbm);
		if (!(tc_tcwzczx_dqbm.equals("")))	wheresql+=" and  (tc_tcwzczx.dqbm='"+tc_tcwzczx_dqbm+"')";
	}
	tc_tcwzczx_bjjbbm=request.getParameter("tc_tcwzczx_bjjbbm");
	if (tc_tcwzczx_bjjbbm!=null)
	{
		tc_tcwzczx_bjjbbm=cf.GB2Uni(tc_tcwzczx_bjjbbm);
		if (!(tc_tcwzczx_bjjbbm.equals("")))	wheresql+=" and  (tc_tcwzczx.bjjbbm='"+tc_tcwzczx_bjjbbm+"')";
	}
	tc_tcwzczx_xmmc=request.getParameter("tc_tcwzczx_xmmc");
	if (tc_tcwzczx_xmmc!=null)
	{
		tc_tcwzczx_xmmc=cf.GB2Uni(tc_tcwzczx_xmmc);
		if (!(tc_tcwzczx_xmmc.equals("")))	wheresql+=" and  (tc_tcwzczx.xmmc='"+tc_tcwzczx_xmmc+"')";
	}
	tc_tcwzczx_ppmc=request.getParameter("tc_tcwzczx_ppmc");
	if (tc_tcwzczx_ppmc!=null)
	{
		tc_tcwzczx_ppmc=cf.GB2Uni(tc_tcwzczx_ppmc);
		if (!(tc_tcwzczx_ppmc.equals("")))	wheresql+=" and  (tc_tcwzczx.ppmc='"+tc_tcwzczx_ppmc+"')";
	}
	tc_tcwzczx_xh=request.getParameter("tc_tcwzczx_xh");
	if (tc_tcwzczx_xh!=null)
	{
		tc_tcwzczx_xh=cf.GB2Uni(tc_tcwzczx_xh);
		if (!(tc_tcwzczx_xh.equals("")))	wheresql+=" and  (tc_tcwzczx.xh='"+tc_tcwzczx_xh+"')";
	}
	tc_tcwzczx_jldw=request.getParameter("tc_tcwzczx_jldw");
	if (tc_tcwzczx_jldw!=null)
	{
		tc_tcwzczx_jldw=cf.GB2Uni(tc_tcwzczx_jldw);
		if (!(tc_tcwzczx_jldw.equals("")))	wheresql+=" and  (tc_tcwzczx.jldw='"+tc_tcwzczx_jldw+"')";
	}
	tc_tcwzczx_dj=request.getParameter("tc_tcwzczx_dj");
	if (tc_tcwzczx_dj!=null)
	{
		tc_tcwzczx_dj=tc_tcwzczx_dj.trim();
		if (!(tc_tcwzczx_dj.equals("")))	wheresql+=" and  (tc_tcwzczx.dj="+tc_tcwzczx_dj+") ";
	}
	tc_tcwzczx_lrr=request.getParameter("tc_tcwzczx_lrr");
	if (tc_tcwzczx_lrr!=null)
	{
		tc_tcwzczx_lrr=cf.GB2Uni(tc_tcwzczx_lrr);
		if (!(tc_tcwzczx_lrr.equals("")))	wheresql+=" and  (tc_tcwzczx.lrr='"+tc_tcwzczx_lrr+"')";
	}
	tc_tcwzczx_lrsj=request.getParameter("tc_tcwzczx_lrsj");
	if (tc_tcwzczx_lrsj!=null)
	{
		tc_tcwzczx_lrsj=tc_tcwzczx_lrsj.trim();
		if (!(tc_tcwzczx_lrsj.equals("")))	wheresql+="  and (tc_tcwzczx.lrsj=TO_DATE('"+tc_tcwzczx_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_tcwzczx.bjbbh,tc_tcwzczx.dqbm,dm_dqbm.dqmc,tc_tcwzczx.bjjbbm,tc_tcwzczx.xmmc,tc_tcwzczx.ppmc,tc_tcwzczx.xh,tc_tcwzczx.jldw,tc_tcwzczx.dj,tc_tcwzczx.bz,tc_tcwzczx.lrr,tc_tcwzczx.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_tcwzczx  ";
    ls_sql+=" where tc_tcwzczx.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_tcwzczxList.jsp","","","EditTc_tcwzczx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"bjbbh","dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_tcwzczx_ppmc","tc_tcwzczx_xh","tc_tcwzczx_jldw","tc_tcwzczx_dj","tc_tcwzczx_bz","tc_tcwzczx_lrr","tc_tcwzczx_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bjbbh","dqbm","bjjbbm","xmmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_tcwzczxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from tc_tcwzczx where "+chooseitem;
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
	<td  width="7%">���۰汾��</td>
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