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
	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String dqbm=null;

	String sfjzsf=null;
	sfjzsf=request.getParameter("sfjzsf");
	if (sfjzsf!=null)
	{
		sfjzsf=cf.GB2Uni(sfjzsf);
		if (!(sfjzsf.equals("")))	wheresql+=" and  (sfjzsf='"+sfjzsf+"')";
	}

	String sfjrhtjz=null;
	sfjrhtjz=request.getParameter("sfjrhtjz");
	if (sfjrhtjz!=null)
	{
		sfjrhtjz=cf.GB2Uni(sfjrhtjz);
		if (!(sfjrhtjz.equals("")))	wheresql+=" and  (sfjrhtjz='"+sfjrhtjz+"')";
	}

	String sffqsk=null;
	sffqsk=request.getParameter("sffqsk");
	if (sffqsk!=null)
	{
		sffqsk=cf.GB2Uni(sffqsk);
		if (!(sffqsk.equals("")))	wheresql+=" and  (sffqsk='"+sffqsk+"')";
	}

	String cbjjsfs=null;
	cbjjsfs=request.getParameter("cbjjsfs");
	if (cbjjsfs!=null)
	{
		cbjjsfs=cf.GB2Uni(cbjjsfs);
		if (!(cbjjsfs.equals("")))	wheresql+=" and  (cbjjsfs='"+cbjjsfs+"')";
	}

	String sfxsq=null;
	sfxsq=request.getParameter("sfxsq");
	if (sfxsq!=null)
	{
		sfxsq=cf.GB2Uni(sfxsq);
		if (!(sfxsq.equals("")))	wheresql+=" and  (sfxsq='"+sfxsq+"')";
	}

	String sfxmlx=null;
	sfxmlx=request.getParameter("sfxmlx");
	if (sfxmlx!=null)
	{
		sfxmlx=cf.GB2Uni(sfxmlx);
		if (!(sfxmlx.equals("")))	wheresql+=" and  (sfxmlx='"+sfxmlx+"')";
	}
	String sfcysgdjs=null;
	sfcysgdjs=request.getParameter("sfcysgdjs");
	if (sfcysgdjs!=null)
	{
		sfcysgdjs=cf.GB2Uni(sfcysgdjs);
		if (!(sfcysgdjs.equals("")))	wheresql+=" and  (sfcysgdjs='"+sfcysgdjs+"')";
	}
	String sfkdz=null;
	sfkdz=request.getParameter("sfkdz");
	if (sfkdz!=null)
	{
		sfkdz=cf.GB2Uni(sfkdz);
		if (!(sfkdz.equals("")))	wheresql+=" and  (sfkdz='"+sfkdz+"')";
	}

	String jrsjbz=null;
	jrsjbz=request.getParameter("jrsjbz");
	if (jrsjbz!=null)
	{
		jrsjbz=cf.GB2Uni(jrsjbz);
		if (!(jrsjbz.equals("")))	wheresql+=" and  (jrsjbz='"+jrsjbz+"')";
	}
	String jrglfbz=null;
	jrglfbz=request.getParameter("jrglfbz");
	if (jrglfbz!=null)
	{
		jrglfbz=cf.GB2Uni(jrglfbz);
		if (!(jrglfbz.equals("")))	wheresql+=" and  (jrglfbz='"+jrglfbz+"')";
	}
	
	
	sfxmbm=request.getParameter("sfxmbm");
	if (sfxmbm!=null)
	{
		sfxmbm=cf.GB2Uni(sfxmbm);
		if (!(sfxmbm.equals("")))	wheresql+=" and  (sfxmbm='"+sfxmbm+"')";
	}
	sfxmmc=request.getParameter("sfxmmc");
	if (sfxmmc!=null)
	{
		sfxmmc=cf.GB2Uni(sfxmmc);
		if (!(sfxmmc.equals("")))	wheresql+=" and  (sfxmmc like '%"+sfxmmc+"%')";
	}
	sflx=request.getParameter("sflx");
	if (sflx!=null)
	{
		sflx=cf.GB2Uni(sflx);
		if (!(sflx.equals("")))	wheresql+=" and  (sflx='"+sflx+"')";
	}
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (sfbxx='"+sfbxx+"')";
	}
	sfjrqye=request.getParameter("sfjrqye");
	if (sfjrqye!=null)
	{
		sfjrqye=cf.GB2Uni(sfjrqye);
		if (!(sfjrqye.equals("")))	wheresql+=" and  (sfjrqye='"+sfjrqye+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bdm_sfxmbm.dqbm='"+dqbm+"')";
	}

	ls_sql="SELECT bdm_sfxmbm.dqbm,dqmc,sfxmbm,sfxmmc,dysfxmmc,DECODE(sfxmlx,'1','��ӹ��̷�','2','������ط�','3','��Ʒ�','4','��˾�����ļ�ӷ�','5','���̹����','6','����˰��','7','��˾�����Ĺ����','8','��˾������˰��','A','�Թ����Ĺ����','B','�Թ�����˰��','C','�Թ����ļ�ӷ�','D','ˮ��·','E','ˮ��·Ԥ��','9','����') sfxmlx,DECODE(sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����(�ɸ�)','3','˰���ۺ��ͬ���˰�ʣ�','8','˰����ǰ˰���˰���ۿۣ�','4','�̶����(���ɸ�)','5','�����','6','��˾�����İٷֱ�(���ɸ�)','7','�Թ����İٷֱ�(���ɸ�)','9','���ٷֱ�����Ʒ�','B','��װ���̹����','C','��װ���Ĺ����','D','��װ���̷Ѱٷֱ�','E','��װ���ķѰٷֱ�','F','��˾�����İٷֱ�(�ɸ�)','G','�Թ����İٷֱ�(�ɸ�)') sflx,gdje,DECODE(sfcysgdjs,'Y','��','N','��') sfcysgdjs,jldw, DECODE(sfbxx,'1','��ѡ','2','�Ǳ�ѡ') sfbxx, DECODE(sfjrqye,'1','��','2','����') sfjrqye, DECODE(jrsjbz,'1','��ȡ','2','����ȡ') jrsjbz, DECODE(jrglfbz,'1','��ȡ','2','����ȡ') jrglfbz, DECODE(sfssjf,'1','��ȡ','2','����ȡ') sfssjf, DECODE(sfkdz,'N','���ɴ���','Y','�ɴ���') sfkdz,zdzk, DECODE(sfxsq,'1','����','2','����Ȩ','3','ͣ��') sfxsq, DECODE(sffqsk,'1','��','2','��') sffqsk, DECODE(cbjjsfs,'1','��ǰ','2','�ۺ�','3','������') cbjjsfs,DECODE(sfjrhtjz,'Y','����','N','��') sfjrhtjz,DECODE(sfjzsf,'Y','��װ','N','��') sfjzsf,bz ";
	ls_sql+=" FROM bdm_sfxmbm,dm_dqbm  ";
    ls_sql+=" where ( bdm_sfxmbm.dqbm=dm_dqbm.dqbm(+))";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by bdm_sfxmbm.dqbm,sfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bdm_sfxmbmList.jsp","","","EditBdm_sfxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","sfxmbm","sfxmmc","dysfxmmc","sfxmlx","sflx","gdje","sfcysgdjs","jldw","sfbxx","sfjrqye","jrsjbz","jrglfbz","sfssjf","sfkdz","zdzk","sfxsq","sffqsk","cbjjsfs","sfjrhtjz","sfjzsf","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","sfxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBdm_sfxmbm.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
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
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="3%">�շ���Ŀ����</td>
	<td  width="9%">�շ���Ŀ����</td>
	<td  width="9%">�շ���Ŀ��ӡ����</td>
	<td  width="5%">�շ���Ŀ����</td>
	<td  width="9%">�շѼ��㷽ʽ</td>
	<td  width="4%">�̶����</td>
	<td  width="3%">����ʩ���ӽ���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">�Ƿ��ѡ</td>
	<td  width="3%">�Ƿ����ҵ��</td>
	<td  width="3%">�Ƿ���ȡ˰��</td>
	<td  width="3%">�Ƿ���ȡ�����</td>
	<td  width="3%">�Ƿ���ȡ��Ʒ�</td>
	<td  width="3%">�Ƿ�ɴ���</td>
	<td  width="3%">����ۿ�</td>
	<td  width="3%">���ʦ�Ƿ�����Ȩʹ��</td>
	<td  width="3%">�Ƿ�����տ�</td>
	<td  width="3%">�ɱ��ۼ��㷽ʽ</td>
	<td  width="3%">�����ͬ��ֵë��</td>
	<td  width="3%">�Ƿ�װ�շ�</td>
	<td  width="13%">��ע</td>
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